# Maintainer: Philipp Jonczyk <p dot jonczyk at posteo dot de>
pkgname=python-daily-dozen
pkgver=1.0
pkgrel=1
pkgdesc="CLI tool to store your daily dozen of plant based essentials."
arch=('any')
url="https://github.com/randomn4me/daily-dozen-cli/"
license=('ISC')
depends=('python'
         'python-tabulate')
source=("daily-dozen.py")
md5sums=('7bd44e942039646b94dedd00e6d1e0c9')
provides=("python-daily-dozen=$pkgver-$pkgrel")
source=("https://github.com/randomn4me/${pkgname#python-}-cli/archive/${pkgver}.tar.gz")


package() {
    cd "${pkgname#python-}-cli-${pkgver}"

    install -Dm755 "${srcdir}/${pkgname#python-}-cli-${pkgver}/daily-dozen.py" \
        "${pkgdir}/usr/bin/daily-dozen"

    install -Dm644 "${srcdir}/${pkgname#python-}-cli-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
