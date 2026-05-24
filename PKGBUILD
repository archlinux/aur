# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: bohoomil <@zoho.com>

pkgname=otf-inconsolata-lgc
pkgver=2.220
pkgrel=1
pkgdesc="Monospace font for pretty code listings and for the terminal, with Cyrillic and Greek support."
url="http://github.com/MihailJP/Inconsolata-LGC"
arch=('any')
license=(OFL)
source=("${url}/releases/download/LGC-${pkgver}/InconsolataLGC-OT-${pkgver}.tar.xz"
        45-inconsolata-lgc.conf
        90-non-tt-inconsolata-lgc.conf)
sha512sums=('724d0592e7d09a7ba17293b8726857d547b862888af628cbd3811f6efa574088e53053186447fef99cf9405a1ce6dc4adc13cd5873c7aca02cbf67ea268a0406'
            'ce4aa734a2484b3dbde67da47f8a14a86753d74293309214f49b60fe13fe9b6daace94d8ba8f922dc678c04702f3a9c6d090954b90848c5794c5ce3ef91342de'
            '2e689ac81a9650f460748b353fa0bbdc902b1ed33ab1a39de67d4b729b09a2b7e65c896b63d03cfb8444e5babbe60a3d5b62d7fa72c9cafa765073aacff09ee8')

package(){
  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 InconsolataLGC-OT/*.otf "${pkgdir}"/usr/share/fonts/"${pkgname}"

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
