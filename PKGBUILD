# Maintainer: James An <james@jamesan.ca>

pkgname=systemd-resolved-public-dns
pkgver=2
pkgrel=1
pkgdesc="Config files defining well-known, public, IPv4 and IPv6 DNS servers for systemd's DNS resolver (includes DNSSEC)"
arch=('any')
url="https://github.com/jamesan/aur-pkgs/tree/master/$pkgname"
license=('GPL')
source=(
    alternate-dns.conf
    blockaid-public-dns.conf
    censurfridns.conf
    chaos-computer-club-berlin.conf
    christoph-hochstatter.conf
    claranet.conf
    comodo-secure-dns.conf
    dns-advantage.conf
    dnsreactor.conf
    dns.watch.conf
    dyn.conf
    fdn.conf
    foebud.conf
    fooldns.conf
    freedns.conf
    freenom-world.conf
    german-privacy-foundation-ev.conf
    google-public-dns.conf
    greenteamdns.conf
    hurricane-electric.conf
    level3.conf
    neustar-dns-advantage.conf
    new-nations.conf
    norton-dns.conf
    opendns.conf
    opennic.conf
    powerns.conf
    puntcat.conf
    quad9.conf
    safedns.conf
    skydns.conf
    smartviper-public-dns.conf
    validom.conf
    verisign.conf
    xiala.net.conf
    yandex.dns.conf
)
md5sums=('2cceeb5bfc56cc6637cd361121b15a53'
         '0627722b8754288ba6abd9793ef603b7'
         'ec1356dbee2d165ab19f93eff264bef0'
         '80daa89eed96de895b54a58c325d8273'
         '7889fef471faabc0483db133005f7320'
         '5179e1b34f3751db5a0ebbef97a8c356'
         '5b909aa3206b222f34db204908196d7a'
         '92ae9aef034229d1ae1a7356760dc5b0'
         'ee4df09900780f0611e909e7d4d3ea73'
         '52a72a161e7e7c72435778ad5cfe8059'
         '040a94243820773564c82bb57070c68f'
         'be747116817a8987597364630aa809ec'
         '3e6a9efc6766f08a091012ccea17ed97'
         '9507b9f9f91e9c697f06683a17720f24'
         'be9890a04159cc4485271f878b46f42b'
         'df19b5fd0cf2461e135ac1d90126791d'
         '4d72e70fa89f17f4816bed40fbd626cc'
         'e6583c0f183d8d4d6eb82e973cb6e968'
         '4043fffbd006a0c50368759cf5cc798d'
         '953a7f1ca1994ce155aec924adea0d7b'
         '4722724e843a5c3d7b5b052d9befd8d2'
         '04f1e43c5b01a9280f8f6a2125057a22'
         'b1b7270a64429807290605a9abad6c0d'
         'fd5ad6b3167cedfc4211e8746293d35c'
         '0b35d80150db515a3f5de27eca6d41c0'
         'c591c050e5bedff86959cf57684a240e'
         '7094086d2d4fab585b078cbc035b9496'
         'c466ad65a6925942ac01325ab00726c7'
         'c13f7d6d157375439348b62d765fa014'
         '64123bdde7b8258164b431eec9f8cedb'
         '4abdeb4f84ac53cab6768d3692027d54'
         '6fbf56e5c3529012ef8e5196af10375c'
         'daab49702642e6f75f6bba654d857f87'
         '4faee5805134df266edf8e33c8ecf71c'
         'c061f4e9fa4efc106f3114ee7a3104f2'
         'e51f146fe8b283455a38cc5108bbe9ab')

package() {
    install -dm755 "$pkgdir/etc/systemd/resolved.conf.d"
    for CONF in *.conf; do
        install -Dm644 "$CONF" "$pkgdir/usr/lib/systemd/resolved.conf.d/$CONF"
        ln -s /dev/null "$pkgdir/etc/systemd/resolved.conf.d/$CONF"
    done
}
