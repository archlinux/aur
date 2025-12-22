# Maintainer: Jonghyo Lee <na1307@outlook.kr>

pkgbase=nanum-fonts
_ttfs=(
  ttf-nanumgothic
  ttf-nanumgothic-eco
  ttf-nanummyeongjo
  ttf-nanummyeongjo-eco
  ttf-nanummyeongjo-yethangul
  ttf-nanumbarungothic
  ttf-nanumbarungothic-yethangul
  ttf-nanumbarunpen
  ttf-nanumbrush
  ttf-nanumpen
  ttf-nanumsquare
  ttf-nanumsquareround
  ttf-nanumsquareneo
  ttf-nanumsquareneo-variable
  ttf-nanumhuman
)
_otfs=(
  otf-nanumgothic
  otf-nanumgothic-eco
  otf-nanummyeongjo
  otf-nanummyeongjo-eco
  otf-nanummyeongjo-yethangul
  otf-nanumbarungothic
  otf-nanumbarungothic-yethangul
  otf-nanumbarunpen
  otf-nanumbrush
  otf-nanumpen
  otf-nanumsquare
  otf-nanumsquareround
  otf-nanumsquareneo
  otf-nanumhuman
)
pkgname=(
  ttf-nanum-meta
  "${_ttfs[@]}"
  otf-nanum-meta
  "${_otfs[@]}"
)
pkgver=20241017
pkgrel=2
arch=('any')
url="https://hangeul.naver.com/font"
license=('custom:OFL')
source=(
  "https://hangeul.naver.com/hangeul_static/webfont/zips/nanum-all_new.zip"
  "OFL.txt"
)
sha256sums=(
  '173fd24bf38914f385401f602572dca3481f7669966e91ad289066f719f6cc56'
  '65c23f0be72b06e4e77f273a399c24cb57a310fbe273cf4bd6dc10d4dff9c2ba'
)

_install_license() {
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

_install_ttfs() {
  for f in "$srcdir/나눔 글꼴/$1"/*.ttf; do
    install -Dm644 -t "$pkgdir/usr/share/fonts/nanum" "$f"
  done

  _install_license
}

_install_otfs() {
  for f in "$srcdir/나눔 글꼴/$1"/*.otf; do
    install -Dm644 -t "$pkgdir/usr/share/fonts/nanum" "$f"
  done

  _install_license
}

package_ttf-nanum-meta() {
  pkgdesc='Naver Nanum fonts meta package (TrueType)'
  provides=(ttf-nanum)
  depends=("${_ttfs[@]}")
}

package_otf-nanum-meta() {
  pkgdesc='Naver Nanum fonts meta package (OpenType)'
  depends=("${_otfs[@]}")
}

package_ttf-nanumgothic() {
  pkgdesc='Naver NanumGothic TrueType font'

  _install_ttfs 나눔고딕/NanumFontSetup_TTF_GOTHIC
}

package_otf-nanumgothic() {
  pkgdesc='Naver NanumGothic OpenType font'

  _install_otfs 나눔고딕/NanumFontSetup_OTF_GOTHIC
}

package_ttf-nanumgothic-eco() {
  pkgdesc='Naver NanumGothic Eco TrueType font'

  _install_ttfs 나눔고딕에코/NanumFontSetup_TTF_GOTHICECO
}

package_otf-nanumgothic-eco() {
  pkgdesc='Naver NanumGothic Eco OpenType font'

  _install_otfs 나눔고딕에코/NanumFontSetup_OTF_GOTHICECO
}

package_ttf-nanummyeongjo() {
  pkgdesc='Naver NanumMyeongjo TrueType font'

  _install_ttfs 나눔명조/NanumFontSetup_TTF_MYUNGJO
}

package_otf-nanummyeongjo() {
  pkgdesc='Naver NanumMyeongjo OpenType font'

  _install_otfs 나눔명조/NanumFontSetup_OTF_MYUNGJO
}

package_ttf-nanummyeongjo-eco() {
  pkgdesc='Naver NanumMyeongjo Eco TrueType font'

  _install_ttfs 나눔명조에코/NanumFontSetup_TTF_MYUNGJOECO
}

package_otf-nanummyeongjo-eco() {
  pkgdesc='Naver NanumMyeongjo Eco OpenType font'

  _install_otfs 나눔명조에코/NanumFontSetup_OTF_MYUNGJOECO
}

package_ttf-nanummyeongjo-yethangul() {
  pkgdesc='Naver NanumMyeongjo YetHangul TrueType font'

  install -Dm644 -t "$pkgdir/usr/share/fonts/nanum" "$srcdir/나눔 글꼴/나눔명조옛한글/NanumMyeongjo-YetHangul.ttf"
  _install_license
}

package_otf-nanummyeongjo-yethangul() {
  pkgdesc='Naver NanumMyeongjo YetHangul OpenType font'

  install -Dm644 -t "$pkgdir/usr/share/fonts/nanum" "$srcdir/나눔 글꼴/나눔명조옛한글/NanumMyeongjo-YetHangul.otf"
  _install_license
}

package_ttf-nanumbarungothic() {
  pkgdesc='Naver NanumBarunGothic TrueType font'

  _install_ttfs 나눔바른고딕/NanumFontSetup_TTF_BARUNGOTHIC
}

package_otf-nanumbarungothic() {
  pkgdesc='Naver NanumBarunGothic OpenType font'

  _install_otfs 나눔바른고딕/NanumFontSetup_OTF_BARUNGOTHIC
}

package_ttf-nanumbarungothic-yethangul() {
  pkgdesc='Naver NanumBarunGothic YetHangul TrueType font'

  install -Dm644 -t "$pkgdir/usr/share/fonts/nanum" "$srcdir/나눔 글꼴/나눔바른고딕옛한글/NanumBarunGothic-YetHangul.ttf"
  _install_license
}

package_otf-nanumbarungothic-yethangul() {
  pkgdesc='Naver NanumBarunGothic YetHangul OpenType font'

  install -Dm644 -t "$pkgdir/usr/share/fonts/nanum" "$srcdir/나눔 글꼴/나눔바른고딕옛한글/NanumBarunGothic-YetHangul.otf"
  _install_license
}

package_ttf-nanumbarunpen() {
  pkgdesc='Naver NanumBarunPen TrueType font'

  _install_ttfs 나눔바른펜/NanumFontSetup_TTF_BARUNPEN
}

package_otf-nanumbarunpen() {
  pkgdesc='Naver NanumBarunPen OpenType font'

  _install_otfs 나눔바른펜/NanumFontSetup_OTF_BARUNPEN
}

package_ttf-nanumbrush() {
  pkgdesc='Naver NanumBrush TrueType font'

  install -Dm644 -t "$pkgdir/usr/share/fonts/nanum" "$srcdir/나눔 글꼴/나눔손글씨_붓/NanumBrush.ttf"
  _install_license
}

package_otf-nanumbrush() {
  pkgdesc='Naver NanumBrush OpenType font'

  install -Dm644 -t "$pkgdir/usr/share/fonts/nanum" "$srcdir/나눔 글꼴/나눔손글씨_붓/NanumBrush.otf"
  _install_license
}

package_ttf-nanumpen() {
  pkgdesc='Naver NanumPen TrueType font'

  install -Dm644 -t "$pkgdir/usr/share/fonts/nanum" "$srcdir/나눔 글꼴/나눔손글씨_펜/NanumPen.ttf"
  _install_license
}

package_otf-nanumpen() {
  pkgdesc='Naver NanumPen OpenType font'

  install -Dm644 -t "$pkgdir/usr/share/fonts/nanum" "$srcdir/나눔 글꼴/나눔손글씨_펜/NanumPen.otf"
  _install_license
}

package_ttf-nanumsquare() {
  pkgdesc='Naver NanumSquare TrueType font'

  _install_ttfs 나눔스퀘어/NanumFontSetup_TTF_SQUARE
}

package_otf-nanumsquare() {
  pkgdesc='Naver NanumSquare OpenType font'

  _install_otfs 나눔스퀘어/NanumFontSetup_OTF_SQUARE
}

package_ttf-nanumsquareround() {
  pkgdesc='Naver NanumSquareRound TrueType font'

  _install_ttfs 나눔스퀘어라운드/NanumFontSetup_TTF_SQUARE_ROUND
}

package_otf-nanumsquareround() {
  pkgdesc='Naver NanumSquareRound OpenType font'

  _install_otfs 나눔스퀘어라운드/NanumFontSetup_OTF_SQUARE_ROUND
}

package_ttf-nanumhuman() {
  pkgdesc='Naver NanumHuman TrueType font'

  _install_ttfs 나눔휴먼
}

package_otf-nanumhuman() {
  pkgdesc='Naver NanumHuman OpenType font'

  _install_otfs 나눔휴먼
}

package_ttf-nanumsquareneo() {
  pkgdesc='Naver NanumSquareNeo TrueType font'

  _install_ttfs NanumSquareNeo/NanumSquareNeo/TTF
}

package_otf-nanumsquareneo() {
  pkgdesc='Naver NanumSquareNeo OpenType font'

  _install_otfs NanumSquareNeo/NanumSquareNeo/OTF
}

package_ttf-nanumsquareneo-variable() {
  pkgdesc='Naver NanumSquareNeo Variable TrueType font'

  install -Dm644 -t "$pkgdir/usr/share/fonts/nanum" "$srcdir/나눔 글꼴/NanumSquareNeo/NanumSquareNeo/NanumSquareNeo-Variable.ttf"
  _install_license
}
