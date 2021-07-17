# Maintainer: Max Gautier <mg+archlinux@max.gautier.name>
_pkgname=base16-alacritty
pkgname=base16-alacritty-git
pkgver=r19.914727e
pkgrel=1
pkgdesc="Base16 templates for the alacritty terminal emulator"
url="https://github.com/aarowill/$_pkgname"
license=('MIT')
arch=(any)
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    install -Dt "$pkgdir"/usr/share/alacritty/colors colors/*
    install -Dt "$pkgdir"/usr/share/licenses/"$pkgname"/ LICENSE
}
