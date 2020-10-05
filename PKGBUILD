# Maintainer: Oystein Sture <oysstu@gmail.com>
pkgname=eprosima-fast-dds-gen
pkgver=1.0.4
pkgrel=1
pkgdesc="Fast-DDS IDL code generator tool"
arch=('any')
url="https://github.com/eProsima/Fast-DDS-Gen"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('gradle' 'git')
optdepends=()
source=("git+https://github.com/eProsima/Fast-DDS-Gen.git#tag=v${pkgver}")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
    cd "${srcdir}/Fast-DDS-Gen"
    gradle assemble
}

package() {
    cd "${srcdir}/Fast-DDS-Gen"
    mkdir -p "gradle_home"
    gradle install -g "${srcdir}/Fast-DDS-Gen/gradle_home" --install_path="${pkgdir}/usr/"
}
