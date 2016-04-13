# Contributor: 3ED <krzysztof1987@gmail.com>

pkgname=festival-pl-em
pkgver=0.1
pkgrel=3
pkgdesc="Polish diphone female voice for Festival. (Polski zenski glos)"
url="http://festlang.berlios.de/docu/doku.php?id=languages"
license=("custom")
depends=('festival' 'licenses')
install="festival-pl-em.install"
source=(http://repository.slacky.eu/slackware-13.0/multimedia/festival_polish/20091229/src/festival_polish_voice.tgz
        festival-pl.sh)
arch=('any')
sha256sums=('2fbbe7609a9b52c19f591d39741f6cd5ea935e49bbac9dfb7d5d85462ec181d0'
            'a34b47ab3f8e80a33e97057bc253ec13d4d1d0f448ef40b15d8c3884118340ce')

package() {
  install -dm755 \
    "$pkgdir"/usr/{bin,share/{licenses/$pkgname,festival/voices/polish/cstr_pl_em_diphone/{festvox,group}}}/

  install -m755 \
    "$srcdir/festival-pl.sh" \
    "$pkgdir/usr/bin/festival-pl"
  install -m644 \
    "$srcdir/cstr_pl_em_diphone/festvox/"* \
    "$pkgdir/usr/share/festival/voices/polish/cstr_pl_em_diphone/festvox/"
  install -m644 \
    "$srcdir/cstr_pl_em_diphone/group/"* \
    "$pkgdir/usr/share/festival/voices/polish/cstr_pl_em_diphone/group/"
  install -m644 \
    "$srcdir/cstr_pl_em_diphone/"{przeczytajto.txt,README} \
    "$pkgdir/usr/share/festival/voices/polish/cstr_pl_em_diphone/"

  ln -s \
    "/usr/share/festival/voices/polish/cstr_pl_em_diphone/README" \
    "$pkgdir/usr/share/licenses/$pkgname/cstr_pl_em_diphone"
  ln -s \
    "/usr/share/licenses/common/GPL3/license.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/festival-pl"
}
