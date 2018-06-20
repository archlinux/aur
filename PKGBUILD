# Maintainer: bohoomil <@zoho.com>

pkgname=ttf-symbola-ib
pkgver=11.00
pkgrel=3
depends=('fontconfig')
pkgdesc="Symbola is a free symbol-type font."
url="http://users.teilar.gr/~g1951d/"
arch=('any')
conflicts=('ttf-symbola')
provides=('ttf-symbola')
replaces=('ttf-symbola')
groups=('infinality-bundle-fonts')
license=('custom')
#Symbola has become non redistributable so we'll just do the file:// and allow each one to download manually
source=("file://Symbola.zip"
        "LICENSE"
        "45-symbola.conf"
        "90-tt-symbola.conf")
sha512sums=('be7b3fd8b2070a6713b189c0ee0c6d8aef481eb0c7e476dabfa3eb1a599cc7f3a00f14d7b9ca1f563722d550c098f272f62bb99fc490aba8132ed5ae7de59a7b'
            'e61b7ade8d2a9bd039821663d064153167f6a62d425e67e8a3f93d0dd7667b40e325bdc9d0020fcbf0248f49a3e97c1865d434a45fa6675479dfc8c41620adfb'
            'e30c8c2ccf70f89602e2326fc969d1ccaa1a14fb07ff19314d98554c1f3051078476a3fb8bce2ee56e22cd1574cd5d6fd2efd5eb4ca88ca04e9cd4586e29c4fe'
            'af22a299541b042694ce1b962beef101b612a0992318fb8c9a003defbd4e53c2ffbcb9f584eaa8d0b1fd55cfa175c978aaa495837242dfa38c74d51b19d11044')

package(){
  cd $srcdir
  install -D -m644 LICENSE \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

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
