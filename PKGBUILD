# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-caladea-ib
pkgver=20140817
pkgrel=1
_tarname=crosextrafonts
depends=('fontconfig')
pkgdesc="A serif font metrically compatible with Cambria"
url="https://code.google.com/p/chromium/issues/detail?id=168879"
arch=('any')
groups=('infinality-bundle-fonts')
license=('Apache')
source=(http://mirrors.ctan.org/fonts/caladea.zip
        45-caladea.conf
        90-tt-caladea.conf)
sha1sums=('a335d5e0d236cdd074ebe2964b9b8d409839513a'
          '90d29666e807c1f7456f4ffa86f4b6ed5b92639b'
          'd4747515ff61405209314f9d909975eec01f56bf')

package(){
  cd caladea

  install -D -m644 doc/LICENSE-2.0 \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 truetype/*.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  cd "${srcdir}"
  install -D -m644 45-caladea.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-caladea.conf
  install -D -m644 90-tt-caladea.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-caladea.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-caladea.conf .
  ln -s ../conf.avail/90-tt-caladea.conf .
}
