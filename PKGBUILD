# Maintainer: Alexander Paetzelt <techge+arch [ät] posteo [do] net>

pkgname=mac80211_hwsim_mgmt
pkgver=d6a7e3b
pkgrel=1
pkgdesc="Management tool for mac80211_hwsim kernel module"
arch=('x86_64')
url="https://github.com/patgrosse/mac80211_hwsim_mgmt/"
license=('MIT')
depends=('libevent' 'libnl')
source=("https://github.com/patgrosse/mac80211_hwsim_mgmt/archive/d6a7e3bf683731805c761dbd56af11fb6d6c7e76.tar.gz")
sha256sums=('4e4fed9738764b883a5ca2291253a1386085122d443205bef7eb73c78a536e32')

build() {
    cd mac80211_hwsim_mgmt-d6a7e3bf683731805c761dbd56af11fb6d6c7e76/hwsim_mgmt/
    make all
}

package() {
    cd mac80211_hwsim_mgmt-d6a7e3bf683731805c761dbd56af11fb6d6c7e76
    mkdir -p ${pkgdir}/usr/bin
    install -Dm 0755 hwsim_mgmt/hwsim_mgmt "${pkgdir}/usr/bin/"
    mkdir -p ${pkgdir}/usr/share/licenses/$pkgname
    install -m 644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/"
}
