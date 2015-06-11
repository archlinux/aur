# Maintainer: Benjamin Cremer <bc@benjamin-cremer.de>

pkgname=tideways-cli
pkgver=0.2.3
pkgrel=1
pkgdesc="Tideways Profiler CLI"
arch=('i686' 'x86_64')
url="https://tideways.io"
license=('custom')
provides=('tideways-cli')
conflicts=('tideways-cli')

if [[ $CARCH == "x86_64" ]]; then
    source=("https://s3-eu-west-1.amazonaws.com/qafoo-profiler/downloads/tideways-cli_${pkgver}_linux_amd64.tar.gz")
    sha256sums=('51e6cc99ce54130f621e89e7c4704bf0dba1f36aac2ebce37607e4caf5f635d4')
    _arch=amd64
else
    source=("https://s3-eu-west-1.amazonaws.com/qafoo-profiler/downloads/tideways-cli_${pkgver}_linux_i386.tar.gz")
    sha256sums=('3da16594e5006283041f407d78fb4d88a9521da9a08ee93a6ec5fe3eb551d8f8')
    _arch=i368
fi

package() {
    cd "${srcdir}/tideways-cli_${pkgver}"
    install -Dm755 tideways "${pkgdir}"/usr/bin/tideways
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
