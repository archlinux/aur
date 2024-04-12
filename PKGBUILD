# Maintainer: Trey Blancher $(base64 -d <<< 'dHJleUBibGFuY2hlci5uZXQK')
pkgname=newrelic-fluent-bit-bin
_pkg=fluent-bit
_debrel=bookworm
pkgver=2.0.8
pkgrel=1
pkgdesc="High performance and multi platform Log Forwarder for New Relic"
arch=('aarch64' 'x86_64')
url="https://github.com/newrelic/fluent-bit-package"
license=('Apache')
groups=('newrelic')
depends=('e2fsprogs'
    'gcc-libs'
    'glibc'
    'keyutils'
    'krb5'
    'libcap'
    'libgcrypt'
    'libgpg-error'
    'libldap'
    'libsasl'
    'libyaml'
    'lz4'
    'openssl'
    'postgresql-libs'
    'systemd-libs'
    'xz'
    'zlib'
    'zstd')
checkdepends=()
optdepends=()
provides=('newrelic-fluent-bit')
conflicts=('newrelic-fluent-bit')
replaces=()
backup=("etc/${_pkg}/${_pkg}.conf"
        "etc/${_pkg}/parsers.conf"
        "etc/${_pkg}/plugins.conf")
options=()
install=
changelog=CHANGELOG
source_aarch64=("https://github.com/newrelic/fluent-bit-package/releases/download/${pkgver}/${_pkg}_${pkgver}_debian-${_debrel}_arm64.deb")
sha256sums_aarch64=('f1c1a6040b261000f92631b21acbe4fd5e37f40e9554a6daa7c0aaf032a3c52b')
source_x86_64=("https://github.com/newrelic/fluent-bit-package/releases/download/${pkgver}/${_pkg}_${pkgver}_debian-${_debrel}_amd64.deb")
sha256sums_x86_64=('7e8b27c460a22323fabb7278d87442468c9c7053ab2c9924d1a8331b3597e15b')

package() {
    mkdir ${pkgdir}/usr
    tar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
    pushd ${pkgdir} &> /dev/null
    mv lib usr/
    popd &> /dev/null
}
