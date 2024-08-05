# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=rofi-tmux
_name=${pkgname//-/_}
pkgver=0.4
pkgrel=1
pkgdesc="Quickly switches tmux sessions, windows and tmuxinator projects"
arch=(any)
url="https://github.com/viniarck/rofi-tmux"
license=(MIT)
groups=()
depends=(python rofi tmux python-rofi python-libtmux)
makedepends=(python-build python-installer)
provides=(lsbi)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6768c28fa47c845c7a27b561f1bdf65c0b2378529146f3af9cea77d8370a488b')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

