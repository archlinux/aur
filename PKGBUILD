# Maintainer: Philipp Jonczyk <p dot jonczyk at posteo dot de>
pkgname=python-daily-dozen
pkgver=1.5
pkgrel=1
pkgdesc="CLI tool to store your daily dozen of plant based essentials."
arch=('any')
url="https://github.com/randomn4me/daily-dozen-cli/"
license=('ISC')
depends=('python'
         'python-tabulate')
source=("daily-dozen.py")
provides=("python-daily-dozen=$pkgver-$pkgrel")
source=("https://github.com/randomn4me/${pkgname#python-}-cli/archive/${pkgver}.tar.gz")
md5sums=('c3da20a4be86adb1a3dd41e3636dbe15')

package() {
    cd "${pkgname#python-}-cli-${pkgver}"

    install -Dm755 "${srcdir}/${pkgname#python-}-cli-${pkgver}/daily-dozen.py" \
        "${pkgdir}/usr/bin/daily-dozen"

    install -Dm644 "${srcdir}/${pkgname#python-}-cli-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
