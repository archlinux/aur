# Maintainer: bretello <bretello@distruzione.org>
pkgname=bretellofier
pkgver=0.5.0
pkgrel=1
pkgdesc="Command line telegram notifier"
arch=(any)
url="https://git.decapod.one/brethil/bretellofier"
license=('dowhateverthefuckyouwant')
depends=(python)
makedepends=(python-build python-setuptools-scm)
source=("git+https://git.decapod.one/brethil/bretellofier")
sha256sums=(SKIP)

pkgver() {
    cd "$pkgname"
    python -m setuptools_scm
}

package() {
    cd "$pkgname"
    pip install .
}


post_install() {
    echo "Run \"bretellofier --generate-config > ~/.bretellofier.conf\" to generate a sample config."
    echo "Replace token and name lines with your bot's token and telegram id"
    echo "Command line flags/environment variables can also be used. See bretellofier --help".
}
