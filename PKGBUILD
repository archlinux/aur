# Maintainer: Neolux Lee <aur.neolux@neolux.cn.eu.org>

pkgname=cjlu-exams2calendar
_pkgname=exams2calendar
pkgver=1.0
pkgrel=0
pkgdesc='Convert exams info of CJLU to calendar events'
arch=(
    'x86_64'
    'arm64'
)
url='https://github.com/neoluxis/CJLU_Exam2Calendar'
depends=(
    'python' 'python-pytesseract' 'python-pillow'
)
source=(
        "$_pkgname::git+https://github.com/neoluxis/CJLU_Exam2Calendar"
    )
sha256sums=('SKIP')
prepare() {
    cd $_pkgname
    cp main.py $_pkgname
}

build() {
    cd $_pkgname
    chmod +x $_pkgname
}

package() {
    install -Dm755 "$_pkgname/$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
}
