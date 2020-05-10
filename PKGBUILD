# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Mark Weiman <mark.weiman@markzz.com>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Tony Lambiris <tony@critialstack.com>

pkgname=apt
pkgver=2.1.1
pkgrel=1
pkgdesc="Command-line package manager used on Debian-based systems"
arch=('x86_64' 'aarch64' 'armv7' 'armv8' 'armv7l' 'armv7h')
url="https://packages.debian.org"
license=('GPL2')
depends=('gnupg' 'curl' 'xz')
provides=('libapt-inst' 'libapt-pkg' 'libapt-pkg-dev' "apt-utils")
conflicts=(apt-git)
replaces=(apt-git)
source_x86_64=("http://ftp.us.debian.org/debian/pool/main/a/apt/apt_2.1.1_amd64.deb")
source_aarch64=("http://ftp.us.debian.org/debian/pool/main/a/apt/apt_2.1.1_arm64.deb")
source_armv7=("http://ftp.us.debian.org/debian/pool/main/a/apt/apt_2.1.1_armhf.deb")
source_armv7l=("http://ftp.us.debian.org/debian/pool/main/a/apt/apt_2.1.1_armel.deb")
source_armv7h=("http://ftp.us.debian.org/debian/pool/main/a/apt/apt_2.1.1_armhf.deb")
source_armv8=("http://ftp.us.debian.org/debian/pool/main/a/apt/apt_2.1.1_arm64.deb")
sha256sums_x86_64=('87760226e8f796b16eac4f464e09ce7a4cdfa8272af6dfd177435489ecd6a108')
sha256sums_aarch64=('035554b17a9372701875364d3d92dacd2ae71ad1ea68102df12b39a842174eaf')
sha256sums_armv7=('c52f8abcf0c2be06e4fe81b080a51c91a769082e28521333339d0e9fa747299e')
sha256sums_armv7l=('adb2f046c2a11147952694459fb865a6b9fb19acd6f84e21211a9fde226ff7ac')
sha256sums_armv7h=('c52f8abcf0c2be06e4fe81b080a51c91a769082e28521333339d0e9fa747299e')
sha256sums_armv8=('035554b17a9372701875364d3d92dacd2ae71ad1ea68102df12b39a842174eaf')


package () {
cp ${srcdir}/data.tar.xz ${pkgdir}/
cd ${pkgdir}
tar -xf ${pkgdir}/data.tar.xz
rm ${pkgdir}/data.tar.xz
mv ${pkgdir}/lib/systemd ${pkgdir}/usr/lib/
rmdir ${pkgdir}/lib/
}

#FROM PREVIOUS MAINTAINER:
#build from source

#makedepends=('cmake' 'dpkg' 'docbook-xsl' 'doxygen' 'git' 'po4a' 'gtest' 'w3m' 'triehash')
#source=("git+https://salsa.debian.org/apt-team/apt.git#tag=${pkgver}")
#sha256sums=('SKIP')
#build() {
#  cd "$srcdir/$pkgname"
#
#  # docbook xsl is stored with the version on Arch
#  DOCBOOK_XSL_VER=`ls -d /usr/share/xml/docbook/xsl-stylesheets-* | xargs basename`
#
#  cmake \
#	-DCMAKE_INSTALL_PREFIX="/usr" \
#	-DCMAKE_INSTALL_LIBDIR="lib" \
#	-DDOCBOOK_XSL="/usr/share/xml/docbook/${DOCBOOK_XSL_VER}" \
#	.
#
#  sed -i -e "s|stylesheet/docbook-xsl|$DOCBOOK_XSL_VER=t|" doc/*.xsl
#  sed -i -e "s|stylesheet/nwalsh|$DOCBOOK_XSL_VER=|" doc/*.xsl
#
#  make -j $(nproc) all
#}

#package() {
#  cd "$srcdir/$pkgname"
#  make DESTDIR="${pkgdir}" install
#}

# vim:set ts=2 sw=2 et:
