# Maintainer: bohoomil <@zoho.com>

pkgname=ttf-symbola-ib
pkgver=11.00
pkgrel=1
depends=('fontconfig')
pkgdesc="Symbola is a free symbol-type font."
url="http://users.teilar.gr/~g1951d/"
arch=('any')
conflicts=('ttf-symbola')
provides=('ttf-symbola')
replaces=('ttf-symbola')
groups=('infinality-bundle-fonts')
license=('custom')
source=("Symbola-$pkgver.zip::http://users.teilar.gr/~g1951d/Symbola.zip"
        "COPYING"
        "45-symbola.conf"
        "90-tt-symbola.conf")
sha512sums=('d1cf09eb87be4d302a790b25b31f874eb8b1b8e766d94db78ba45084791eaf13d04ad0c61d7fb0848e243fd84b3b1639c71239854c3eca2cf0e81b128c1f0738'
            'fc2c85cbf477fe5600bc1fde7ab7739df1a65a0250259c13df830b60d9afd888b399d137edbb59b74f26e17b2869166cfba0feef90cc925c31ded40931caddf3'
            'e30c8c2ccf70f89602e2326fc969d1ccaa1a14fb07ff19314d98554c1f3051078476a3fb8bce2ee56e22cd1574cd5d6fd2efd5eb4ca88ca04e9cd4586e29c4fe'
            'af22a299541b042694ce1b962beef101b612a0992318fb8c9a003defbd4e53c2ffbcb9f584eaa8d0b1fd55cfa175c978aaa495837242dfa38c74d51b19d11044')

package(){
  cd $srcdir
  install -D -m644 COPYING \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -D -m644 Symbola_Hinted.ttf \
    "${pkgdir}"/usr/share/fonts/"${pkgname}"/Symbola_Hinted.ttf

  install -D -m644 45-symbola.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-symbola.conf
  install -D -m644 90-tt-symbola.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-symbola.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-symbola.conf .
  ln -s ../conf.avail/90-tt-symbola.conf .
}
