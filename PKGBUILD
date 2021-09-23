# Maintainer: Niluge_KiWi <kiwiiii@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: cantabile <cantabile dot desu at gmail dot com>
# created by cantabile <cantabile dot desu at gmail dot com>

pkgname=xkb-qwerty-fr
pkgver=0.5
pkgrel=4
pkgdesc="French qwerty keymap - provides a keymap for French users of qwerty keyboards. All French characters are directly accessible with AltGr and smartly mapped."
arch=('any')
url="http://marin.jb.free.fr/qwerty-fr/"
license=('GPL2')
depends=('xkeyboard-config' 'perl')
install=${pkgname}.install
source=("http://marin.jb.free.fr/qwerty-fr/${pkgname}_${pkgver}_all.deb"
        "xkb-qwerty-fr.hook")
md5sums=('cefc7f02f2a23633d1160c32caa6c132'
         'a48aeeed95e5309eb22399ec4455bfd3')
sha256sums=('03fc6b72b62fb6661e5671bc3e500934ed9aa457159141ef02d989616276ef64'
            '093d2b1d27f77ac5d0cff9a6057ceff18ddc73901a9636ba6533a8e40a63e3cc')

build() {
  cd "$srcdir"
  bsdtar xf data.tar.gz
  bsdtar xf control.tar.gz
}

package() {
  cd "$srcdir"

  install -D -m 755 postinst ${pkgdir}/usr/share/libalpm/scripts/xkb-qwerty-fr.install
  install -D -m 755 postrm ${pkgdir}/usr/share/libalpm/scripts/xkb-qwerty-fr.uninstall
  install -D -m 644 xkb-qwerty-fr.hook ${pkgdir}/usr/share/libalpm/hooks/xkb-qwerty-fr.hook

  install -D -m 644 usr/share/X11/xkb/symbols/us_qwerty-fr ${pkgdir}/usr/share/X11/xkb/symbols/us_qwerty-fr

  install -D -m 644 usr/share/doc/xkb-qwerty-fr/changelog.gz ${pkgdir}/usr/share/doc/xkb-qwerty-fr/changelog.gz
  install -D -m 644 usr/share/doc/xkb-qwerty-fr/copyright ${pkgdir}/usr/share/doc/xkb-qwerty-fr/copyright
  install -D -m 644 usr/share/doc/xkb-qwerty-fr/keymap.txt ${pkgdir}/usr/share/doc/xkb-qwerty-fr/keymap.txt

  install -D -m 644 usr/share/man/man7/qwerty-fr.7.gz ${pkgdir}/usr/share/man/man7/qwerty-fr.7.gz
}
