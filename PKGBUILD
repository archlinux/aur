# Maintainer: Wu Zhenyu <wuzy01@qq.com>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg .
_repo=FooSoft/md2vim
_source_type=github-releases
_upstreamver='21.12.14.0'
_pkgname=${_repo##*/}

pkgname=$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc='Tool for automatically converting markdown to vimdoc format'
arch=(i386 x86_64 arm aarch64)
url=https://github.com/$_repo
license=(MIT)
provides=("$_pkgname-$pkgver")
conflicts=("$_pkgname-$pkgver")
_arch="$(uname -m|sed s/x86_64/amd64/)"
_os="${OSTYPE%%-*}"
[[ $_os == windows ]] && _ext=zip || _ext=tar.gz
source=("$_pkgname-$pkgver::$url/releases/download/$_upstreamver/${pkgname}_${_os}_${_arch}.$_ext")
sha256sums=('65656e9e5b269dd2d5088896178a131f990d83d6e169fd8adb13076a943df75c')

package() {
	cd "$srcdir"
	install -D "$_pkgname" -t "$pkgdir/usr/bin"
}
