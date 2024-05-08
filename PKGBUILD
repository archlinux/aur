# Maintainer: xatier

pkgname=ttf-moe-fonts
pkgver=1
pkgrel=1
pkgdesc='National standard fonts from Taiwan Ministry of Education'
arch=('any')
url='https://language.moe.gov.tw/Result.aspx?classify_sn=23&subclassify_sn=436'
license=('CC-BY-ND-4.0')

# zip links are from the following PDF files
#     https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/edukai.pdf
#     https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/edusun.pdf
#     https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/eduli.pdf
source=(
    "https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/edukai-5.0.zip"
    "https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/eduSong_Unicode.zip"
    "https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/MoeLI-3.0.zip"
)

sha256sums=(
    "57411e9ca399f372bda62fadd521a875d2062d34a0c654ace4a4c61539f3e10b"
    "3b0dadd40938d100fdace2082183e01d5a6c26cb2174513d495c39861f154eb6"
    "fd7e633ed8cebc94d46e2295e6bd9d58814be5fb7489e99dc23f99b7e435dce0"
)

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    mv 'MoeLI(隸書3.0版1080724上網).ttf' MoeLI.ttf

    for font in edukai-5.0 eduSong_Unicode 'MoeLI'; do
        install -Dm644 "${srcdir}/${font}.ttf" "${pkgdir}/usr/share/fonts/TTF/${font}.ttf"
    done
}
