# Maintainer: mybeansarebaked <element.3ueog@simplelogin.co>
pkgname=ytui-git
pkgver=0.r5.195de04
pkgrel=1
pkgdesc='A bad youtube TUI client written in bash'
arch=('any')
license=('GPL')
depends=('mpv' 'youtube-dl' 'fzf' 'wget' 'bash' 'sed' 'awk' 'jq' 'util-linux')
optdepends=('sfeed: RSS subscription feeds')
url='https://notabug.org/mybeansarebaked/ytui.git'
provides=('ytui')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "ytui"
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  srcdir=$srcdir/ytui
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/run.sh" "${pkgdir}/usr/bin/ytui"
  mkdir -p "${pkgdir}/usr/share/ytui"
  chmod +x "${pkgdir}/usr/bin/ytui"
  cp "${srcdir}/art.txt" "${pkgdir}/usr/share/ytui/art.txt"
}

