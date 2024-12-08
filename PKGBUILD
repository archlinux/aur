# Maintainer: Maneren <maneren731@gmail.com>

_langs=(afr amh ara asm aze aze_cyrl bel ben bod bos bre bul cat ceb ces
  chi_sim chi_tra chr cos cym dan dan_frak deu deu_frak div dzo ell enm epo
  equ est eus fao fas fil fin fra frk frm fry gla gle glg grc guj hat heb
  hin hrv hun hye iku ind isl ita ita_old jav jpn kan kat kat_old kaz khm
  kir kmr kor kor_vert lao lat lav lit ltz mal mar mkd mlt mon mri msa
  mya nep nld nor oci ori osd pan pol por pus que ron rus san sin slk
  slk_frak slv snd spa spa_old sqi srp srp_latn sun swa swe syr tam tat
  tel tgk tgl tha tir ton tur uig ukr urd uzb uzb_cyrl vie yid yor)

pkgname=screen-ocr
pkgver=0.1.0
pkgrel=1
pkgdesc="Extract text from screen selection using tesseract."
arch=('x86_64')
license=('MIT')
depends=('tesseract>=4' 'imagemagick>=7' 'spectacle' 'kdialog')
optdepends=($(for l in "${_langs[@]}"; do echo tesseract-data-"$l"; done))
provides=("$pkgname")
source=("$pkgname.sh")
sha256sums=('256959ecb1f7b79dace8beb3ee96a6934778bc200a42f8a14c6c9568789eef2a')

package() {
  mkdir -p "$pkgdir/usr/bin"
  mv "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
