# Maintainer: bretello <bretello@distruzione.org>
pkgname=bretellofier
pkgver=0.4.3
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
    echo "bretellofier cane be configured by creating ~/.bretellofier.conf with the following contents"
    echo "[telegram]
token = XXXXXXXXX:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

[users]
name = 66666666
"
    echo "replace token and name lines with your bot's token and telegram id"
    echo "Environment variables can also be used. See the README".

}
