# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname='python-flix-cli'
_pkgname='flix-cli'
pkgver=1.7.10.8
pkgrel=1
pkgdesc="Watch movies and series from your commandline"
arch=('any')
url="https://github.com/demonkingswarn/flix-cli"
license=('GPL3')
depends=('mpv' 'ffmpeg' 'fzf' 'catt' 'python' 'python-httpx' 'python-regex' 'python-beautifulsoup4' 'python-krfzf')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/ca/ae/772e63fc8b5c7ff92f5d4161b7ff2711810cb514e696bfcfa3c3da60cbb2/flix_cli-${pkgver}-py3-none-any.whl")
sha256sums=('172e5410fbbe7b638da8687dd120a6bc54325977c13abc9bd410652c1a373641')

build(){
        python -m build --no-isolation --wheel "${_pkgname/-/_}-$pkgver"
}

package(){
        _py=$(python --version)
        _py=${_py%%.*}

        python -m installer --destdir="$pkgdir" \
                "$srcdir/${_pkgname/-/_}-$pkgver/dist/${_pkgname/-/_}-${pkgver%.r*}-py${_py##* }-none-any.whl"
}

