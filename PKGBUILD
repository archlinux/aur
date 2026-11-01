# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Matthew Gamble <git@matthewgamble.net>

pkgname="scrutiny-bin"
pkgver=0.10.0
pkgrel=1
pkgdesc="Hard Drive S.M.A.R.T Monitoring, Historical Trends & Real World Failure Thresholds"
url="https://github.com/AnalogJ/scrutiny"
license=("MIT")
arch=("x86_64" "armv5h" "armv6h" "armv7h" "aarch64")
provides=("scrutiny")
conflicts=("scrutiny" "scrutiny-collector")
depends=("smartmontools")
optdepends=("influxdb>=2: run the datastore on the same machine")
backup=("etc/scrutiny/scrutiny.yaml"
        "etc/scrutiny/collector.yaml"
)
install="scrutiny.install"
options=("!strip")

source=(
 "$url/releases/download/v$pkgver/scrutiny-web-frontend.tar.gz"
 "https://raw.githubusercontent.com/AnalogJ/scrutiny/v$pkgver/example.scrutiny.yaml"
 "https://raw.githubusercontent.com/AnalogJ/scrutiny/v$pkgver/example.collector.yaml"
 "scrutiny.sysusers"
 "scrutiny.tmpfiles"
 "scrutiny.service"
 "scrutiny-collector.service"
 "scrutiny-collector.timer"
)

source_x86_64=(
 "$url/releases/download/v$pkgver/scrutiny-web-linux-amd64"
 "$url/releases/download/v$pkgver/scrutiny-collector-metrics-linux-amd64"
)

source_armv5h=(
 "$url/releases/download/v$pkgver/scrutiny-web-linux-arm-5"
 "$url/releases/download/v$pkgver/scrutiny-collector-metrics-linux-arm-5"
)

source_armv6h=(
 "$url/releases/download/v$pkgver/scrutiny-web-linux-arm-6"
 "$url/releases/download/v$pkgver/scrutiny-collector-metrics-linux-arm-6"
)

source_armv7h=(
 "$url/releases/download/v$pkgver/scrutiny-web-linux-arm-7"
 "$url/releases/download/v$pkgver/scrutiny-collector-metrics-linux-arm-7"
)

source_aarch64=(
 "$url/releases/download/v$pkgver/scrutiny-web-linux-arm64"
 "$url/releases/download/v$pkgver/scrutiny-collector-metrics-linux-arm64"
)

b2sums=('5e94abd17b7f2cde6c7c43fa44b1d106dc20560d2fa73f6426da6c3b1277bd61b32418fc82ea4365ba807aaa9286b888723087f9a56ef1a6d4c96d0463b36cb4'
        'f13d9594752239a9878c4efc042797392d8d57cfa1a1ba9158a4717af42e0be82709ab35e2475e3596e436471a4c8d572b32eed45ce95437eeb39e069df2bec9'
        'ddcd28224cb646dd3651852b40f93866d07b9ff2ff29d2821a5ee510b3994c2a60ef19d79d4af42194c29b6249800d5d336cfad8f0d3ec47670a369203660ec3'
        'f634bb3b85695225af5bc77a0e5ec3e09844fa4794b40381e1a6d1e81ac31cdb1d5b342c13bec33537dfed399777017bd3f323a53873d7356abd9eac5f77e677'
        '60006f6ef9e37dd06d2ce64b9f87deebca9b3021db792a1367773a950ccf10ca708f165c6573a5b9766a5c5dd6b4aa4ec3d5967b1538639a8be8bd35f260b5ca'
        '4d523a659a268383ab334668ec1c1ca6cfa66bfb0ed54e4a82cb17a44dad32fffab530014811f1e937af2c54327edb77ace0c3cfb5b0fe091a01ce8df4ce2994'
        'a98118d0c156d056a89ba1177a338a4061e54a029f9c6021cd8f71c77e6acdbf4b4432e371f07f04177655496b3f30818284d089958e7896b22479515bb18bf9'
        '9220ff8673c9976b16abf35b9e4f94d541ff1472c4854f149e2bd09accfba0aa142f17b9d3485fe41ece823256fe53d5665c6761846b071b9975408fefdd443b')
b2sums_x86_64=('2a210e4186460242ce80430ac09f6ca39a42a763157dbf5171c68b6dabdc7fc704e513ce0dd3eabe25ecd9ef4fb43be667455bf79debd92f6310dc08149d8387'
               '69d095cd7822151f2ef33f0cb688f4d761318d673b1224a80d8bae5378d53d86fdf4fce500d6175385707f028f8bc89bc4f77a455c4ea874bdeb148f459360da')
b2sums_armv5h=('a5a048519a7ef6c8e3e8e4f30f74c4f6ea7982a942f64fc0c371083810118fe576ad02781c8f766ee48452b139620a7c30f066ad2e290226554c85dedd11dc05'
               'a80538c60dd7795abe6f1ec567f3632c45cfb83d6f01a32ab111a1fc8fab053c6202c1617cbdb89cde399f18ca8202395355e326bc8cbe656aec1ed01e88a34b')
b2sums_armv6h=('6ce0a97cd1834bb11d8b5a6568c9f15328ad751f8fdf6e760b6581981a4fc3ea1d8ba7f453c5c4eea456b85941dbdfdac3e30c5ef0d13d23085390e138e09a64'
               'f91ba5890c5e17131af177acd91856d06486a910230be2eebedfa028d5e65c70e76d9538e9c79a6815b780486cd710f8e538178cc7fe57ccde4c4f11b0388214')
b2sums_armv7h=('a60e0d04041a7f70f81feb3d5d5af6298eb58ca3518584985a76ceb5b7572927ff80f8e6614b666d536019a9d8fe28368202d85ea4f1cbc64471c8691a51dcd8'
               'ab28878ba8d2a88b9be8cac3f2c5a0ea02f9c6efd8c2f8afd204b323c1dabee9121e2bea73bc3f83f355e221fe7a56a3d032b03986cc68d9d081c66bae965e20')
b2sums_aarch64=('bdfd9c52e794226a96c0b914deed38f940dc7e3beab20fce6f164c38466e51ecba905fbaa1c76dd8565c74c1ebcc36dc089eea83d907403fa3b2d0d61b352759'
                '749bc0964775aad82340c19b4c41c72960101acd08f9457e7e4398c9d58279e50be918437b9bab142b8f40a34709f8162b1d72a4bd1cb67e16687ee9510a3cd2')

prepare(){
 sed -i "example.scrutiny.yaml" \
     -e "s|0\.0\.0\.0|127.0.0.1|g" \
     -e "s|/opt/scrutiny/config/scrutiny.db|/var/lib/scrutiny/scrutiny.db|" \
     -e "s|/opt/scrutiny/web|/usr/share/webapps/scrutiny|" \
     -e "s|file: ''|file: '/var/log/scrutiny/scrutiny.log'|"
}

package(){
 # new folders
 install -d -m 750 "$pkgdir/etc/scrutiny"
 install -d -m 755 "$pkgdir/usr/share/webapps"
 # configuration files
 install -D -m 644 "example.scrutiny.yaml" "$pkgdir/etc/scrutiny/scrutiny.yaml"
 install -D -m 644 "example.collector.yaml" "$pkgdir/etc/scrutiny/collector.yaml"
 # binaries
 case "$CARCH" in
  "x86_64")
   install -D -m 755 "scrutiny-web-linux-amd64" "$pkgdir/usr/bin/scrutiny"
   install -D -m 755 "scrutiny-collector-metrics-linux-amd64" "$pkgdir/usr/bin/scrutiny-collector"
  ;;
  "armv5h")
   install -D -m 755 "scrutiny-web-linux-arm-5" "$pkgdir/usr/bin/scrutiny"
   install -D -m 755 "scrutiny-collector-metrics-linux-arm-5" "$pkgdir/usr/bin/scrutiny-collector"
  ;;
  "armv6h")
   install -D -m 755 "scrutiny-web-linux-arm-6" "$pkgdir/usr/bin/scrutiny"
   install -D -m 755 "scrutiny-collector-metrics-linux-arm-6" "$pkgdir/usr/bin/scrutiny-collector"
  ;;
  "armv7h")
   install -D -m 755 "scrutiny-web-linux-arm-7" "$pkgdir/usr/bin/scrutiny"
   install -D -m 755 "scrutiny-collector-metrics-linux-arm-7" "$pkgdir/usr/bin/scrutiny-collector"
  ;;
  "aarch64") 
   install -D -m 755 "scrutiny-web-linux-arm64" "$pkgdir/usr/bin/scrutiny"
   install -D -m 755 "scrutiny-collector-metrics-linux-arm64" "$pkgdir/usr/bin/scrutiny-collector"
   ;;
  *) echo "[KO] Unsupported architecture provided" && return 1;;
 esac
 # systemd units
 install -D -m 644 "scrutiny.sysusers" "$pkgdir/usr/lib/sysusers.d/scrutiny.conf"
 install -D -m 644 "scrutiny.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/scrutiny.conf"
 install -D -m 644 "scrutiny.service" "$pkgdir/usr/lib/systemd/system/scrutiny.service"
 install -D -m 644 "scrutiny-collector.service" "$pkgdir/usr/lib/systemd/system/scrutiny-collector.service"
 install -D -m 644 "scrutiny-collector.timer" "$pkgdir/usr/lib/systemd/system/scrutiny-collector.timer"
 # frontend files
 cp -r "dist" "$pkgdir/usr/share/webapps/scrutiny"
}
