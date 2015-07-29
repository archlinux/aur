# Maintainer: bohoomil <@zoho.com>

pkgname=otf-inconsolata-lgc
pkgver=1.12
pkgrel=3
depends=('fontconfig')
pkgdesc="Monospace font for pretty code listings and for the terminal, with Cyrillic and Greek support."
url="http://github.com/MihailJP/Inconsolata-LGC"
arch=('any')
license=('custom:OFL')
install=$pkgname.install
#http://github.com/MihailJP/Inconsolata-LGC
source=(http://bohoomil.com/src/inconsolata-lgc.tar.bz2{,.sig}
        45-inconsolata-lgc.conf
        90-non-tt-inconsolata-lgc.conf)
validpgpkeys=('A9244FB5E93F11F0E975337FAE6866C7962DDE58')
sha1sums=('933f0cf5d0f55e2e8211cb85a4698f6229573908'
          'SKIP'
          '58a5c6d496ab66eb9a26b8625b6f2e6a491320a4'
          '8b44fe50ceff3063acfefeafe8f1963f9fa97fc5')

package(){
  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 *.otf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -m755 -d "${pkgdir}"/etc/fonts/conf.avail
  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  install -m644 45-inconsolata-lgc.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-inconsolata-lgc.conf
  install -m644 90-non-tt-inconsolata-lgc.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-non-tt-inconsolata-lgc.conf

  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-inconsolata-lgc.conf .
  ln -s ../conf.avail/90-non-tt-inconsolata-lgc.conf .
}
