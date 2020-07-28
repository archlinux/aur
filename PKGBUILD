# Maintainer: Chris Harvey <chris@chrisnharvey.com>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=thunderbird-ubuntu-bin
_pkgname=thunderbird
pkgver=68.10.0
pkgrel=1
_ubuntuver="$pkgver+build1-0ubuntu0"
pkgdesc="Standalone mail and news reader from mozilla.org Ubuntu patches (binary)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.thunderbird.net/"
license=(MPL GPL LGPL)
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib alsa-lib
         nss hunspell sqlite ttf-font icu)  # libvpx
optdepends=('libcanberra: sound support')
provides=('thunderbird' 'thunderbird-ubuntu')
conflicts=('thunderbird' 'thunderbird-ubuntu')

source_i686=("http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu/pool/main/t/thunderbird/thunderbird_${_ubuntuver}.19.10.1_i386.deb")
source_x86_64=("http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu/pool/main/t/thunderbird/thunderbird_${_ubuntuver}.20.04.1_amd64.deb")
source_arm=("http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu/pool/main/t/thunderbird/thunderbird_${_ubuntuver}.20.04.1_armhf.deb")
source_armv6h=("$source_arm")
source_armv7h=("$source_arm")
source_aarch64=("http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu/pool/main/t/thunderbird/thunderbird_${_ubuntuver}.20.04.1_amd64.deb")

sha512sums_i686=('592fd385e1854a0129e7606e022d483b3a14fab701cf27ed446483be548b90d3a4be881c155865d4d8e46768214dbda19ecb491bc70345d99e440fc16ce038a1')
sha512sums_x86_64=('fb2569165cdafb985d75bf69a404dd9be2a7114fb4d4f26b37f7aecfae574fbe141adf29738f34a930cd7de9f7c03c5e8d69e158a0f2c9cbe762c2172e839494')
sha512sums_arm=('fa490e170bc5cbd805b7ba28af912cd1e45778ee640b1c7920ffc1311187f745eeb698a68c822c575f1c0237353163fce3624fed1a87b38a8069dc796be707dd')
sha512sums_armv6h=('fa490e170bc5cbd805b7ba28af912cd1e45778ee640b1c7920ffc1311187f745eeb698a68c822c575f1c0237353163fce3624fed1a87b38a8069dc796be707dd')
sha512sums_armv7h=('fa490e170bc5cbd805b7ba28af912cd1e45778ee640b1c7920ffc1311187f745eeb698a68c822c575f1c0237353163fce3624fed1a87b38a8069dc796be707dd')
sha512sums_aarch64=('fb2569165cdafb985d75bf69a404dd9be2a7114fb4d4f26b37f7aecfae574fbe141adf29738f34a930cd7de9f7c03c5e8d69e158a0f2c9cbe762c2172e839494')

prepare() {
        # Don't extract copyright files, which are included in the licenses package
        tar -xvf data.tar.xz --exclude=usr/share/doc
}

package() {
        cp -r etc "$pkgdir/"
        cp -r usr "$pkgdir/"
}