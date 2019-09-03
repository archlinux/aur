# Maintainer: Niluge_KiWi <kiwiiii@gmail.com>
# Contributor: Thomas Jost <schnouki@schnouki.net>
# Contributor: cantabile <cantabile dot desu at gmail dot com>
# created by cantabile <cantabile dot desu at gmail dot com>

pkgname=xkb-qwerty-fr
pkgver=0.5
pkgrel=3
pkgdesc="French qwerty keymap - provides a keymap for French users of qwerty keyboards. All French characters are directly accessible with AltGr and smartly mapped."
arch=('any')
url="http://marin.jb.free.fr/qwerty-fr/"
license=('GPL2')
depends=('xkeyboard-config' 'perl')
install=${pkgname}.install
source=("http://marin.jb.free.fr/qwerty-fr/${pkgname}_${pkgver}_all.deb"
        "xkb-qwerty-fr.hook")
md5sums=('cefc7f02f2a23633d1160c32caa6c132'
         '7b16a0405f6fd5b308869b4b87abc7e7')
sha256sums=('03fc6b72b62fb6661e5671bc3e500934ed9aa457159141ef02d989616276ef64'
            '38e7edfaa1eee4bc6e3a8e8b9fddd87e463372d81cc4e0c00429fb9c8c800f98')

build() {
  cd "$srcdir"
  bsdtar xf data.tar.gz
  bsdtar xf control.tar.gz
}

package() {
  cd "$srcdir"

  install -D -m 755 postinst ${pkgdir}/usr/bin/xkb-qwerty-fr.install
  install -D -m 755 postrm ${pkgdir}/usr/bin/xkb-qwerty-fr.uninstall

  install -D -m 644 xkb-qwerty-fr.hook ${pkgdir}/usr/share/libalpm/hooks/xkb-qwerty-fr.hook

  install -D -m 644 usr/share/X11/xkb/symbols/us_qwerty-fr ${pkgdir}/usr/share/X11/xkb/symbols/us_qwerty-fr

  install -D -m 644 usr/share/doc/xkb-qwerty-fr/changelog.gz ${pkgdir}/usr/share/doc/xkb-qwerty-fr/changelog.gz
  install -D -m 644 usr/share/doc/xkb-qwerty-fr/copyright ${pkgdir}/usr/share/doc/xkb-qwerty-fr/copyright
  install -D -m 644 usr/share/doc/xkb-qwerty-fr/keymap.txt ${pkgdir}/usr/share/doc/xkb-qwerty-fr/keymap.txt

  install -D -m 644 usr/share/man/man7/qwerty-fr.7.gz ${pkgdir}/usr/share/man/man7/qwerty-fr.7.gz
}
