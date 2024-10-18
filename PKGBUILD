# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-gpt-command-line
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.2.1
pkgrel=1
pkgdesc="Command-line interface for ChatGPT, Claude and Bard"
arch=(any)
url="https://github.com/kharvd/gpt-cli"
license=(MIT)
groups=()
depends=(python-anthropic python-attrs python-black python-cohere python-google-generativeai python-openai python-mistralai python-prompt_toolkit python-pytest python-pyyaml python-rich python-typing_extensions python-cohere)
makedepends=(python-build python-installer)
provides=(gpt)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('3136d272c92f0de280c75a95d20e2629cdfa700bba96c5fa39eefd9f522d6af1')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

