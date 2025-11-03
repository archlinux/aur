# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_srcname=Xiaomi-cloud-tokens-extractor
pkgname=${_srcname,,}
pkgver=1.5.1
pkgrel=1
pkgdesc="Extract tokens for devices connected to Xiaomi cloud"
arch=('any')
url="https://github.com/PiotrMachowski/Xiaomi-cloud-tokens-extractor"
license=('MIT')
depends=(
    'python'
    'python-charset-normalizer'
    'python-colorama'
    'python-pillow'
    'python-pycryptodome'
    'python-requests'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/PiotrMachowski/Xiaomi-cloud-tokens-extractor/archive/refs/tags/v${pkgver}.tar.gz"
       "launcher.sh")
b2sums=('7a275a2c7dcdb02c0b60a94912f7f2da12b4134bec95787ccacadcefed8e2276c62518c40ae74f3b88ae63f3de74571c355e912bbd7cc15b441a1f7d2f3306fd'
        '2af6f5f46cb3ea61e251db141b25d20161797822c3533acae03aaef0176c2cfc94706b54f81a04a3977aee0442f7bb7e3ab38e5bd2ac9f946ad7128dfd4a8e4c')

package() {
    install -D -m755 launcher.sh "${pkgdir}/usr/bin/${pkgname}"

    cd "${_srcname}-$pkgver"
    install -D -m644 token_extractor.py -t "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
