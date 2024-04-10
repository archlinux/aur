# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="stalwart-mail-bin"
pkgver=0.7.0
pkgrel=1
pkgdesc="Secure & Modern All-in-One Mail Server (IMAP, JMAP, SMTP)"
arch=("x86_64" "aarch64")
url="https://stalw.art/"
license=("AGPL-3.0")
provides=("stalwart" "stalwart-mail")
conflict=("stalwart" "stalwart-mail")
optdepends=("stalwart-cli: command line interface"
            "postgresql: storage backend"
            "sqlite: storage backend"
            "mariadb: storage backend"
            "redis: lookup storage backend")
source=("config.toml"
        "stalwart."{service,sysusers,tmpfiles})
source_x86_64=("https://github.com/stalwartlabs/mail-server/releases/download/v$pkgver/stalwart-mail-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/stalwartlabs/mail-server/releases/download/v$pkgver/stalwart-mail-aarch64-unknown-linux-gnu.tar.gz")
b2sums=('671da72fb777c44c8ce09cc130be246c22eba43fb6d8a01450b04a6727a36bad5dadf16c8a3d924e4be3f34e2914128674711e06ed53d6013bfeb546b0c5400c'
        'fc075fd22b0fb622f516f4e3eb360fadaf484bc744cda0d5add7be74f77d26322cfef20e0ad0aa9ef9d15e8d6503fc043ccc3fc8c9c40803cde570fd0c82acf7'
        '2b7ed52588e70aa3f77fb7f16dcbd9aa02c2137aa92ba99f71e797734e6e617747f225a0582473c1c356ec4611ba57c72ad3855ea43f57d426c5a1e2174b91ad'
        '2915e7410e317dbf78e164af09b65c1c5b737782cf8ec7c5cd287be58306a16d823c3afd55d9569e89561ec7a712a6fcd3487af1d0351847829cdd202d4c9489')
b2sums_x86_64=('b20a2335db87bc63d5e17bad054707b6942da7c56332030f58815d117cb56d06e22e296d515676f769662ee7cfc3d1f16f75b0fba6d40a8d649eae333cb2d3b3')
b2sums_aarch64=('ba9f8501822141d64ece8b3d6c20ea3b945282917f855ec3cca5eae167cf3f8dd8ba8ec2af2e779f53df39bb8a7362393ec3452d195af39e31bb22bab1c44a5a')
b2sum_x86_64=("A")
b2sum_aarch64=("A")
backup=("etc/stalwart/config.toml")
install="stalwart.install"

package(){
 install -d -m 0750 "$pkgdir/etc/stalwart"
 install -D -m 0755 "stalwart-mail"     "$pkgdir/usr/bin/stalwart-mail"
 install -D -m 0644 "stalwart.service"  "$pkgdir/usr/lib/systemd/system/stalwart.service"
 install -D -m 0644 "stalwart.sysusers" "$pkgdir/usr/lib/sysusers.d/stalwart.conf"
 install -D -m 0644 "stalwart.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/stalwart.conf"
 install -D -m 0640 "config.toml"       "$pkgdir/etc/stalwart/config.toml"
}
