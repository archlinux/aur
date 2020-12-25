# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-ubuntu-arabic
pkgver=0.84+arabic
pkgrel=3
pkgdesc="Public release of Arabic font to Ubuntu Xenial Xerus"
arch=('any')
url="https://launchpad.net/ubuntu/+source/ubuntu-font-family-sources/0.84~mono0.83+arabicfontconfig-0ubuntu1"
license=('custom:Ubuntu Font Licence 1.0')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/ubuntu-font-family-sources_0.84~mono0.83+arabicfontconfig.orig-arabicbeta.tar.gz"
        LICENCE.txt
        65-ubuntu-arabic.conf)
sha256sums=('1689b229420dcef4aee0a3a2e9bfaa7a5ef20b2f7c28d8f96f018f926bed2675'
            '2f0015108d68627bd788d313f529c21ff4da2c2c42a5e1f3883acc83480f9002'
            '1518e32cd57c92370a3044c53974e1ce03cd9bd75451a477152bd03acbfbc5a9')

package() {
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 arabicbeta/*.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 LICENCE.txt

  # Install fontconfig files
  install -Dt "$pkgdir"/etc/fonts/conf.avail -m644 *.conf
  install -d "$pkgdir"/etc/fonts/conf.d
  ln -rs "$pkgdir"/etc/fonts/conf.avail/* "$pkgdir"/etc/fonts/conf.d
}
