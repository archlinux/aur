#Maintainer: Cyan Lin <xusine at outlook dot com>

pkgname=surfer-waveform-git-bin
pkgver=0.3.0.r559.6d5bead3
pkgrel=1
provides=('surfer-waveform')
pkgdesc='A waveform viewer with a focus on a snappy usable interface, and extensibility.'
arch=('x86_64')
url='https://gitlab.com/surfer-project/surfer'
license=('EUPL')
depends=('openssl')
source=("$pkgname-$pkgver.zip::https://gitlab.com/surfer-project/surfer/-/jobs/7170213156/artifacts/download?file_type=archive")
sha256sums=('09f82bc5fe73332a0409b171a4bc9dd65f7320f7bc9e6f327c7455dcdd1a7fe7')

prepare() {
    mkdir -p ${srcdir}/$pkgname-$pkgver
    unzip -o ${srcdir}/$pkgname-$pkgver.zip -d ${srcdir}/$pkgname-$pkgver
    unzip -o ${srcdir}/$pkgname-$pkgver/surfer_linux.zip -d ${srcdir}/$pkgname-$pkgver
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/surfer" "$pkgdir/usr/bin/surfer"
}
