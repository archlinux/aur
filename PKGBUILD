# Maintainer      : Emilia Stoyanova <emiliaps31+aur@gmail.com>
# Upstream Authors: Sébastien Leduc  <https://github.com/sleduc>


_pkgname=weechat-xmpp
pkgname=${_pkgname}-git
#pkgver() { git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'; }
pkgver=unknown
pkgrel=1
pkgdesc="A fork of the jabber plugin for weechat"
arch=('any')
url="https://github.com/sleduc/${_pkgname}"
license=('GPL3')
depends=("weechat" "python-xmpppy" "python")
provides=("${_pkgname}")
source=("git+$url.git#branch=master")
install="${_pkgname}.install"
md5sums=('SKIP')

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 jabber.py "${pkgdir}/usr/lib/weechat/python/jabber.py"
}
