# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Daniel Muñoz Lozano <daniel2002munoz(at)outlook(dot)com>
_pkgname=passmenu-custom
pkgname=$_pkgname-git
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="passmenu-custom extends the functionality of the original with fast, integrated OTP handling and additional options"
arch=('i686' 'x86_64')
url="https://github.com/danielml-mx/passmenu-custom.git"
license=('GPL')
groups=()

# Only pass and bash are added since they are called explicitly 
# by the script.
#
# pass-otp is technically not needed since the script will
# just not trigger any OTP functionality if not found.
#
# xdotool is not included since it may be used in a Wayland 
# environment.
#
# dmenu is not included since it may (should) be installed locally.
depends=('pass' 'bash')

makedepends=('git')
checkdepends=()
optdepends=(
    'xdotool: --type option support under X11'
    'ydotool: --type option support under Wayland'
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "$_pkgname"
    printf "%s.r%s.g%s" \
        "$(git describe --tags --abbrev=0 2>/dev/null || echo 0)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"

}

package() {
    cd "$_pkgname"
    install -Dm 755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
