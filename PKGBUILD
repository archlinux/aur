pkgname=ttf-kannada-font
pkgver=0.0
pkgrel=0
pkgdesc="Kannada Font"
arch=(any)
depends=(fontconfig xorg-font-utils)
url="http://kannada.indiatyping.com"

source=(
"http://kannada.indiatyping.com/images/downloadfonts/Kannada/BARAHA_Kannad.zip"
"http://kannada.indiatyping.com/images/downloadfonts/Kannada/BRHKANNW.zip"
"http://kannada.indiatyping.com/images/downloadfonts/Kannada/BRHMUSIC.zip"
"http://kannada.indiatyping.com/images/downloadfonts/Kannada/BRHVEDIC.zip"
"http://kannada.indiatyping.com/images/downloadfonts/Kannada/KAILASAM.zip"
"http://kannada.indiatyping.com/images/downloadfonts/Kannada/UMA_Kannada.zip"
"http://kannada.indiatyping.com/images/downloadfonts/akshar.zip"
)

md5sums=(
f71cbf7a0f61a8b3a2831a2face21f11
0a4dcf89b8c6607dfc4cca0f2f48b591
245d82f001bf0e2fe01ca674d4a96035
10dae096b1af741a3fcb25e7c8854ca5
0e5e8f746abea7d429b907d18674b6a0
aa0b0250200f375aa3984998b7f2eb9b
be623cbc7218dff9f005128ad485c53c
)

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$srcdir/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
}

post_install() {
  echo -n "Updating font cache... "
  fc-cache >/dev/null -f
  mkfontscale /usr/share/fonts/TTF
  mkfontdir   /usr/share/fonts/TTF
  echo done
}

post_upgrade() {
  post_install
}

post_remove() {
  post_install
}
