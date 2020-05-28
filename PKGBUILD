# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-vlgothic-ibx
pkgver=20141206
pkgrel=1
depends=('fontconfig')
pkgdesc="Japanese VL Gothic font family"
url="http://vlgothic.dicey.org/"
arch=('any')
groups=('infinality-bundle-fonts-extra')
conflicts=('ttf-vlgothic')
replaces=('ttf-vlgothic')
license=('custom')
source=(http://dl.sourceforge.jp/vlgothic/62375/VLGothic-$pkgver.tar.xz
        40-vlgothic.conf
        90-tt-vlgothic.conf)
sha1sums=('6d5b590176f8e7586187936cd6c921bf733c9f2a'
          'cd717d0fdc70283af46ce105d83e60bfb03876a6'
          '601b38d1927bd5dbe6ef4cbb04dabc5f8b9d08df')

package(){
  cd VLGothic

  install -D -m644 LICENSE.en "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  cd "${srcdir}"
  install -D -m644 40-vlgothic.conf \
    "${pkgdir}"/etc/fonts/conf.avail/40-vlgothic.conf
  install -D -m644 90-tt-vlgothic.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-vlgothic.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/40-vlgothic.conf .
  ln -s ../conf.avail/90-tt-vlgothic.conf .
}
