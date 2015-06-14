# Maintainer: Det <nimetonmaili g-mail>
# Contributors: Igor Duarte Cardoso, haagch, Olivier Médoc

pkgname=vmware-patch
pkgver=11.1.0
pkgrel=5
pkgdesc="A post-install configuration solution for VMware Workstation and Player (Plus and Pro)"
arch=('i686' 'x86_64')
url="https://wiki.archlinux.org/index.php/VMware#Configuration"
license=('GPL')
depends=('fuse' 'gtkmm' 'linux-headers')
options=('!emptydirs')
install=$pkgname.install
source=('vmware-patch' 'vmware-unpatch' 'common-functions.sh' 'vmware.service' 'vmware-usbarbitrator.service' 'vmware-workstation.service'
        # Workstation 11.1.0 / Player (Pro) 7.1.0
        'vmnet-11.1.0-3.19.patch'
        # Workstation 10.0.6 / Player (Plus) 6.0.6
        'vmci-10.0.6-4.0.patch'
        'vmci-10.0.6-3.19.patch'
        'vsock-10.0.6-3.15.patch'
        'vsock-10.0.6-3.19.patch'
        # Workstation 10.0.5 / Player (Plus) 6.0.5
        'vmmon-10.0.5-3.14.patch'
        'vmnet-10.0.5-3.17.patch'
        # Workstation 10.0.4 / Player (Plus) 6.0.4
        'vmci-10.0.4-3.14.patch'
        'vmmon-10.0.4-3.14.patch'
        'vmnet-10.0.4-3.14.patch'
        'vsock-10.0.4-3.14.patch'
        # Workstation 10.0.1 / Player (Plus) 6.0.1
        'vmnet-10.0.1-3.13.patch')

package() {
    # Patch scripts
    install -Dm755 vmware-patch "$pkgdir"/usr/bin/vmware-patch
    install -m755 vmware-unpatch "$pkgdir"/usr/bin/

    # Common functions
    install -Dm755 common-functions.sh "$pkgdir"/usr/share/vmware-patch/common-functions.sh

    # Patches
    install -d "$pkgdir"/usr/lib/vmware/modules/patches/
    install -m644 *.patch "$pkgdir"/usr/lib/vmware/modules/patches/

    # Services
    install -Dm644 vmware.service "$pkgdir"/usr/lib/systemd/system/vmware.service
    install -m644 vmware-usbarbitrator.service "$pkgdir"/usr/lib/systemd/system/
    install -m644 vmware-workstation.service "$pkgdir"/usr/lib/systemd/system/
}

# Generated using 'updpkgsums'
md5sums=('2704cbc8b571d60e37ba3837638ccaef'
         'ba054b375308442d43a408dbae5e9401'
         'e86bf4634661c8eb48823b4c69388bfc'
         'c12e765985b324585a548718a6ac9b43'
         'ea3817fb7952932707bfedcf33a70697'
         '56f7f642683e54250372bb57faaf4e95'
         '350679df90d266fe7dd343922622c39e'
         'd5ba75849a3946851506ecbaa9ff3bb5'
         '0a8dbce269c7ac34a63453435a4a9fad'
         '1893542f8144aa0bb96f5433b9c34158'
         '2dbd8389e1a275ea734dcedba8510df1'
         '298e1b59a9e729525cc3fa9d06f127eb'
         '43dee79cc5f5980372e16a20962b3105'
         '0d7c84c3b611bedce3303c24aa666c64'
         '4eca49060d2373c259a0c045520de9f9'
         'acd25c0daccb62af8abf750e6369ae25'
         '86a889febd9bdf88e458244195d604a4'
         'd980b5092aeee55edc6dbafb843d886f')
