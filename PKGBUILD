# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgbase="rustic-rs-scheduler-bin"
pkgname=("rustic-rs-scheduler-server-bin" "rustic-rs-scheduler-client-bin")
pkgver="nightly"
pkgrel=2
pkgdesc="Schedule rustic backups for many clients to a common repository"
url="https://rustic.cli.rs/ecosystem/rustic-scheduler/"
arch=("x86_64" "aarch64" "i686" "armv7h")
license=("Apache-2.0")
source_x86_64=("https://github.com/rustic-rs/nightly/raw/main/rustic_scheduler/rustic-scheduler-nightly-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/rustic-rs/nightly/raw/main/rustic_scheduler/rustic-scheduler-nightly-aarch64-unknown-linux-gnu.tar.gz")
source_i686=("https://github.com/rustic-rs/nightly/raw/main/rustic_scheduler/rustic-scheduler-nightly-i686-unknown-linux-gnu.tar.gz")
source_armv7h=("https://github.com/rustic-rs/nightly/raw/main/rustic_scheduler/rustic-scheduler-nightly-armv7-unknown-linux-gnueabihf.tar.gz")
validpgpkeys=("12B7166D9FD59124416952E34018C5DE3BF8C081")
b2sums_x86_64=("SKIP")
b2sums_aarch64=("SKIP")
b2sums_i686=("SKIP")
b2sums_armv7h=("SKIP")

package_rustic-rs-scheduler-server-bin(){
 pkgdesc+=" (server)"
 provides=("rustic-rs-scheduler-server")
 install -d "$pkgdir/usr/share/rustic"
 cp -r "config" "$pkgdir/usr/share/rustic"
 install -D -m 755 "rustic-scheduler-server" -t "$pkgdir/usr/bin"
}

package_rustic-rs-scheduler-client-bin(){
 pkgdesc+=" (client)"
 provides=("rustic-rs-scheduler-client")
 install -D -m 755 "rustic-scheduler-client" -t "$pkgdir/usr/bin"
}
