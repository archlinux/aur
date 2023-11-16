# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>

pkgname=python-proton-keyring-linux
_gitpkgname=python-proton-keyring-linux
pkgver=0.0.1
pkgrel=9
pkgdesc="The proton-keyring-linux component."
arch=("any")
url="https://github.com/ProtonVPN/python-proton-keyring-linux"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-keyring" "org.freedesktop.secrets")
makedepends=("python-setuptools")
optdepends=(
    'gnome-keyring: Gnome keyring support'
    'pass: pass support'
		'kwallet5: KDE keyring support'
)
source=("git+https://github.com/ProtonVPN/${_gitpkgname}.git#commit=5ff3c7f9a1a162836649502dd23c2fbe1f487d73")
sha256sums=('SKIP')

build() {
    cd "$_gitpkgname"
    python setup.py build
}

package() {
    cd "$_gitpkgname"    
    python setup.py install --root="$pkgdir" --optimize=1
}
