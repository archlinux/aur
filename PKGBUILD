# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="metabase"
pkgver=0.46.6
pkgrel=1
pkgdesc="The simplest, fastest way to get business intelligence and analytics to everyone in your company"
arch=("x86_64")
url="https://www.metabase.com/"
license=("AGPL")
depends=("jre-openjdk-headless")
source=("https://downloads.metabase.com/v$pkgver/metabase.jar"
        "metabase.conf"
        "metabase.service"
        "metabase.sysusers"
        "metabase.tmpfiles"
        )
sha256sums=('8511069190e54d08cdd35dbf89333c2031eb5bbdb637ee20546b6c547e91e64a'
            '911f8e307d972cf965bd26314b3eaa29debb370f661843b08da04e32ce9e826f'
            '63e23295b3a94eaa5a4e9fc18b51328d55a4a689170f4f0f5766a9b3a9433a1b'
            'c670b2c4c4663590ab2ced38b19b196f1b31ab1c6339ef7caa9225e94db82c92'
            '71478a76412929d5d35ce8aafb85a27a3c73b10a37235ed2ad890c47cb31812b')
noextract=("metabase.jar")
options=("!strip")
backup=("etc/metabase.conf")

# https://www.metabase.com/docs/latest/installation-and-operation/running-the-metabase-jar-file
# https://www.metabase.com/docs/latest/installation-and-operation/running-metabase-on-debian

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 755 "metabase.jar" "$pkgdir/usr/bin/metabase"
 install -D -m 640 "metabase.conf" "$pkgdir/etc/metabase.conf"
 install -D -m 644 "metabase.service" "$pkgdir/usr/lib/systemd/system/metabase.service"
 install -D -m 644 "metabase.sysusers" "$pkgdir/usr/lib/sysusers.d/metabase.conf"
 install -D -m 644 "metabase.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/metabase.conf"
}
