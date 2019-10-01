# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=teleport
pkgver=4.1.0
pkgrel=2
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('x86_64' 'arm')
url="https://gravitational.com/teleport"
license=('Apache')
depends=('glibc')
install=teleport.install
source_x86_64=(
    "https://get.gravitational.com/teleport-v${pkgver}-linux-amd64-bin.tar.gz"
    "teleport.service"
    "teleport.yaml"
    )
sha256sums_x86_64=(
    '4ce838239170d8b6b6498b817ee271f9443811bfe069f5a79950cbbdc7b6791e'
    '0cc7b68844d4926d30f2cee4bb6cec67436a95219cf1ba84954aaa34942229f9'
    'df47c23a3dedec886c10953c9689615317771fb7cdcaee271e64b84e66ae0acb'
    )
source_arm=(
    "https://get.gravitational.com/teleport-v${pkgver}-linux-arm-bin.tar.gz"
    "teleport.service"
    "teleport.yaml"
    )
sha256sums_arm=(
    'bbf6bb825b90f8cd1b06e20e6116433a30c25ad911878359a839d14b832734da'
    '0cc7b68844d4926d30f2cee4bb6cec67436a95219cf1ba84954aaa34942229f9'
    'df47c23a3dedec886c10953c9689615317771fb7cdcaee271e64b84e66ae0acb'
    )
source_arm=(
    "https://get.gravitational.com/teleport-v${pkgver}-linux-arm-bin.tar.gz"
    "teleport.service"
    "teleport.yaml"
    )
sha256sums_arm=(
    '6ba88b731dc4aa66f864318e705623a3ce1aabb888a17058852799419c75ecc1'
    '0cc7b68844d4926d30f2cee4bb6cec67436a95219cf1ba84954aaa34942229f9'
    'df47c23a3dedec886c10953c9689615317771fb7cdcaee271e64b84e66ae0acb'
    )
options=(!strip)

backup=('etc/teleport/teleport.yaml')

package() {
    mkdir -p "${pkgdir}/usr/lib/systemd/system" "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/etc/teleport"

    install -m644 -t "${pkgdir}/etc/teleport/" teleport.yaml

    install -m644 -t "${pkgdir}/usr/lib/systemd/system/" teleport.service

    cd "${srcdir}/teleport"
    install -m755 -t "${pkgdir}/usr/bin/" teleport tctl tsh
    # no man pages, docs or web assets in release tarball
}

