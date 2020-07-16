# Maintainer: Chris Chamberlain <chris@chamberlain.id.au>
_themename=minimal-dark-bgrt
pkgname=plymouth-theme-minimal-dark-bgrt-git
pkgver=r11.f8a4731
pkgrel=1
arch=('any')
pkgdesc="Minimal and dark Arch Linux theme for Plymouth, based upon the Debian theme, with extracted BGRT logo"
url="https://github.com/neon64/minimal-dark"
license=('unknown')
groups=()
depends=()
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/neon64/minimal-dark')
noextract=()
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "minimal-dark"
    # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "minimal-dark"/plymouth

    ./generate.sh

    _themedir="$pkgdir/usr/share/plymouth/themes/$_themename"

    install -Dm 0644 bgrt.png "${_themedir}/bgrt.png"
    install -Dm 0644 minimal-dark-bgrt.plymouth "${_themedir}/minimal-dark-bgrt.plymouth"
    install -Dm 0644 minimal-dark-bgrt.script "${_themedir}/minimal-dark-bgrt.script"
    install -Dm 0644 password_field.png "${_themedir}/password_field.png"
    install -Dm 0644 progress_dot_off.png "${_themedir}/progress_dot_off.png"
    install -Dm 0644 progress_dot_on.png "${_themedir}/progress_dot_on.png"
}
