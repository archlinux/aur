# Maintainer: xatier

pkgname=ttf-moe-fonts
pkgver=1
pkgrel=1
pkgdesc='National standard fonts from Taiwan Ministry of Education'
arch=('any')
url='https://language.moe.gov.tw/material/list?u=9fd3b76d-d663-4508-bad1-a61d34e68850&category=71&page=1'
license=('CC-BY-ND-4.0')

# Kai:  https://language.moe.gov.tw/material/info?m=9fe3fe82-8bbf-44c0-961d-873ea079e284
# Song: https://language.moe.gov.tw/material/info?m=9fe3fc3b-7fb3-4692-b6f0-7fe176d86ccb
# Li:   https://language.moe.gov.tw/material/info?m=9fe3fb11-c3d5-41f2-b029-6d18a2c2fd0d
source=(
    "https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/edukai-5.1.zip"
    "https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/eduSong_Unicode.zip"
    "https://language.moe.gov.tw/001/Upload/Files/site_content/M0001/MoeLI-3.0.zip"
)

sha256sums=(
    "0cc23456a8bbf639133ee88da7430a9dfe8519ba1f8e4e4b6dce1ab4180435cb"
    "59ae90ddb92aa82dc94f2e731270ae421ee13368ddc2d07d14e0719f2acf60e3"
    "fd7e633ed8cebc94d46e2295e6bd9d58814be5fb7489e99dc23f99b7e435dce0"
)

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    mv 'MoeLI(隸書3.0版1080724上網).ttf' MoeLI.ttf
    mv edukai-5.1_20251208.ttf edukai-5.1.ttf

    for font in edukai-5.1 edusong_Unicode 'MoeLI'; do
        install -Dm644 "${srcdir}/${font}.ttf" "${pkgdir}/usr/share/fonts/TTF/${font}.ttf"
    done
}
