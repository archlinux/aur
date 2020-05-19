# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetruntime-bin
pkgver=3.1.1
pkgrel=1
pkgdesc=".NET Core runtime libraries for the Duet software framework"
arch=('armv7h' 'aarch64')
url="https://github.com/chrishamm/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duetruntime=${pkgver}")
conflicts=('duetruntime')
depends=('curl' 'gettext' 'libunwind')
options=(!strip staticlibs)
source_armv7h=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetruntime_${pkgver}_armhf.deb")
source_aarch64=("https://pkg.duet3d.com/dists/stable/armv7/binary-arm64/duetruntime_${pkgver}_arm64.deb")
md5sums_armv7h=('bd26e1cce51f7fea3e5d5d09e38e8c7c')
md5sums_aarch64=('c92513b068f5ef0b50ded6908d230c8b')
sha1sums_armv7h=('60a25a6e0d0a1aac67ce4c5fadf4e5c49358f785')
sha1sums_aarch64=('58661d2711289ddc5156d4700606166ca4122bd1')
sha256sums_armv7h=('8148b7055c9d0e413b81b8ee5f74357e6594cbe47f15b16066f8fe34f5251393')
sha256sums_aarch64=('ba3e5c6a020162ba974ecc325d94e67d962bd7e2cc9494cc3a90ce499bfdc25c')
sha512sums_armv7h=('097f7174368060a8c877754a67613dcec8caa0ede092b48bb8e63df51575f37c14328a57eb24325addcb7ebf7b90a6710946945342dfd8e165cfa5c08a8defaa')
sha512sums_aarch64=('dc16ec0be59df1fda3221fc1107b122cdd0e7308fb2705c12432a6a926b2bd1f49dca3c6326953d8a0c909f827b1ad29e1d13833fce35ecc972d4179c696c586')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}"/opt/dsf/bin
	install -m 644 "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
}
