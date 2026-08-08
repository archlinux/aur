# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Matthew Gamble <git@matthewgamble.net>

pkgname="scrutiny-bin"
pkgver=0.9.3
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

b2sums=('a15772c5a8a6f08b3fcc843307fde7a7ee268ebef7cf41e400156c14ffb650cb706ff13f13190fed7f35fa06707e154cbe078653b2bc5c88aee7ce10b7968387'
        '2ec4769cd752f625c08c716ee2f5c3862cbfd388e5ac2537a14f4764be021a14c023b3a69b80d3017205efa74dd175f9f1b32822487446b06e5f0fc6aca42ed0'
        '087acaa4415d3ffdd19c6c4df1132581454a538b02576da291f792ec4fbe54e609e0e033f2132569d6b09f4746594127997414b0c9b17fd5288c49cd28e40bd7'
        'f634bb3b85695225af5bc77a0e5ec3e09844fa4794b40381e1a6d1e81ac31cdb1d5b342c13bec33537dfed399777017bd3f323a53873d7356abd9eac5f77e677'
        '60006f6ef9e37dd06d2ce64b9f87deebca9b3021db792a1367773a950ccf10ca708f165c6573a5b9766a5c5dd6b4aa4ec3d5967b1538639a8be8bd35f260b5ca'
        '4d523a659a268383ab334668ec1c1ca6cfa66bfb0ed54e4a82cb17a44dad32fffab530014811f1e937af2c54327edb77ace0c3cfb5b0fe091a01ce8df4ce2994'
        'a98118d0c156d056a89ba1177a338a4061e54a029f9c6021cd8f71c77e6acdbf4b4432e371f07f04177655496b3f30818284d089958e7896b22479515bb18bf9'
        '9220ff8673c9976b16abf35b9e4f94d541ff1472c4854f149e2bd09accfba0aa142f17b9d3485fe41ece823256fe53d5665c6761846b071b9975408fefdd443b')
b2sums_x86_64=('dae300af3bcf227d7a2e2e03f564f57cb4ec142af9099a13c42e267a569f8d3f5ac4db22b20b7f079b706a13ca6969f5eb88c589ac4729f4c0f8480b12de7473'
               '4408054f8934f94baf9e8b7cc9e4e81d0695b5a393caac83b5a11250e7789e97401fea3d148e33dda92ba8ec99d04fa49ecaf90444d1ddc28d7446fa422df3a7')
b2sums_armv5h=('51f84f96994812b21299d4f1103b6e798a7f138246ec8509d8bb84a16c78b7ef62072462d7abb519e1af476f4cba89065a2c26d82db708d82bd8b9914f3e4d12'
               '8267ca3210cc1a80775ad07fc3b848f1e95fed7ca4b41428fab24fb1585ac49d1eed983624b0cf1a67c29ef44f9d7acc64c1d8174c3def94362b5aadf81a9362')
b2sums_armv6h=('e29beaea329789804ec9553c4d73b0b5505c128f3f3e7c1f07e7b8ddff86405b6566b8d70a54e5e73a743be9087c18fc1fff1c1b3fca461b0a623633aebf79d4'
               '9c02bad380b57c0c8c517199bc28d68820e27ff520c20395080f9ab484028d1edceb597d5ac8b6534ffbd4ba70fffb1d65555a25e0cf5fd8d1d1fcc95dfd9b4f')
b2sums_armv7h=('7a2e376e0e085ebe1c2a624c0e7976d54241d8c55109ae5ead429557466930664f741f27ab137b3f49aa95cefff40a089cc2e37f6f1a958a6d1aa95ce095aa5e'
               '41c74c3c4d3366aa0c4e987bc4b8fac06f364f808453d54a1e139a490272061795cdcad1cab3ec2a381c9fa0c75b431ae1861bd0c154777e70964d8d98becb1c')
b2sums_aarch64=('7dbc8d29fa88f718b9589bedea1a3be4590fc2d96e98912acbf3852dd740c41f58021f08618eb1eed446994f450ff9e9460a27bd450ffefed3d41b604a9e43e0'
                '443a45f5114473d3b72a3ff5d25bc6a1c7e898913a87019aa5f1871c1fa987b4626e5a0fefef512345fa548eb7df30f6d43dcaac9d05f614db3148e0ef377f63')

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
