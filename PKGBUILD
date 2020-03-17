# Maintainer: Martin Rys <rys.pw/#contact_me>

# Latest build ver as per https://download.jitsi.org/jitsi-videobridge/linux/
buildver="1132"

pkgname=jitsi-videobridge
# JVB emits this version in the logs when launched, for example:
# VersionService registered: JVB 0.1.1132
pkgver=0.1.${buildver}
pkgrel=2
epoch=
pkgdesc="Videobridge for Jitsi Meet"
arch=("x86_64")
url="https://github.com/jitsi/jitsi-videobridge"
license=("Apache")
groups=()
depends=("jdk8-openjdk")
makedepends=("unzip")
checkdepends=()
optdepends=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=("etc/jitsi-videobridge/jitsi-videobridge.conf")
options=()
install=
changelog=
source=("https://download.jitsi.org/jitsi-videobridge/linux/jitsi-videobridge-linux-x64-${buildver}.zip"
        service
        config)
noextract=()
sha256sums=("2157d3872747ddae2360f47588327dbd4ed48e93a5b7f21cfccdd67341516077"
            "e2c923b8183d08223df47236581bdd5cae4a96df2eab8826ec661ad7ceb35944"
            "5b185655f1ddfd6003001de47bc7715686182c3991d5e33e8ebd8053559cd5ca")
validpgpkeys=()

package() {
  install -d "${pkgdir}/opt"
  unzip -o jitsi-videobridge-linux-x64-${buildver}.zip
  cp -R "${srcdir}/jitsi-videobridge-linux-x64-${buildver}/" "${pkgdir}/opt/${pkgname}"
  install -Dm644 service "$pkgdir"/usr/lib/systemd/system/jitsi-videobridge.service
  install -Dm644 config "$pkgdir"/etc/jitsi-videobridge/jitsi-videobridge.conf
}
