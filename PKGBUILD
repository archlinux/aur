# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Matthew Gamble <git@matthewgamble.net>

pkgname="scrutiny-bin"
pkgver=0.8.1
pkgrel=2
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

b2sums=('9c508709cc9b6ef7927f4c5ae14414282cd01c45d9513f38ba35eb9d7305d9fa52aec9fbd7e1702b0185b3d45b20cd06b56293880ed1024fa6145db803dd3ddf'
        'f71fe063cbd7a4c6667220c74bb78e9213e77624ea2e76c8e26856274d8d8346b9bc330bd8c6ccbe5525b7f8cc5f9e35130c59717fc5239f69330190ec32fba0'
        '05f5f21cdac179bf43daed1f1927787dd328aeb69d87aeb97aeecd27dc2758d5a7bd591f3ae2a27265fce7ab4fedbfa757496893fbe1b4a794c17ed5108c6efd'
        'f634bb3b85695225af5bc77a0e5ec3e09844fa4794b40381e1a6d1e81ac31cdb1d5b342c13bec33537dfed399777017bd3f323a53873d7356abd9eac5f77e677'
        '60006f6ef9e37dd06d2ce64b9f87deebca9b3021db792a1367773a950ccf10ca708f165c6573a5b9766a5c5dd6b4aa4ec3d5967b1538639a8be8bd35f260b5ca'
        '4d523a659a268383ab334668ec1c1ca6cfa66bfb0ed54e4a82cb17a44dad32fffab530014811f1e937af2c54327edb77ace0c3cfb5b0fe091a01ce8df4ce2994'
        'a98118d0c156d056a89ba1177a338a4061e54a029f9c6021cd8f71c77e6acdbf4b4432e371f07f04177655496b3f30818284d089958e7896b22479515bb18bf9'
        '9220ff8673c9976b16abf35b9e4f94d541ff1472c4854f149e2bd09accfba0aa142f17b9d3485fe41ece823256fe53d5665c6761846b071b9975408fefdd443b')
b2sums_x86_64=('4068717d467122b398baef8a690ac65d5b6596ffed9aab7e5e6b541a9f7e0e75efcbadc17bbcdf882d4f6e64fdd075620dfe1ce33849be159eda69316d3dae1c'
               'd5cb64c2c49cb2b194f3b208593efc0fd56c9ae7302a34f930fa4acacf5b6ef9831358bb1691e2bdac0dc1407a873434004fb110776bdd39254348209ea591e1')
b2sums_armv5h=('c5ab56d389e05d310ba534afbe866a0d85802c9f2961adea68c9be9fbd4949799d5d31fc9097188b8320346ce147dbbd8a8b845af3d594961c278f9dad411b4e'
               '1d821688f9dc3cb0180c006ac0361154aa2d9eb2bd0333de3c4c27b82d5835fc224439f98c4abf7b48d98c6c6eaf3b7f06bc759a416d9957a047119b0a384a3b')
b2sums_armv6h=('a71069888522f553c0225338c2674dba16ca29096735a6735ae9f9b5ccaa01ee785f62ff977985e0b6a6f814cb3fd82133ed40fa753996e9fa132752fa9e3f76'
               'f271cd772938859c5cfe8531c35bdcec9c698ced9dd1cdfe427dbf3169f59b9c64d7ad149716768a0a402cccd1acfefc0844a761f217a5bf62229376eec4d945')
b2sums_armv7h=('77485bb05dbfaab2abafa0f766e8b419a575bc4289bb8683ba70ab902e17fa1b3655ea9455d9e15c7498edea5a590016804341d1bf18c386b31bcb0387c5eae9'
               'a0f030de2b78dffe624ee9e0778f5a9732e8a6cf5e0dbf53df84fb3f5a992a00bf65147729356388b988da29865b9e1c39eaf5b1a427ed9add3a6b0490ce1e7a')
b2sums_aarch64=('403c3ccafa6cdb63c9f6adac2bddeeec947605da5eb4ad4b1b36908556eeddec82d42b0efa83ba7ca379b1023fd1101be0a0a8467c1169c4849a830f20d4cfa1'
                'a44162afb0b017ffb3f966ded0fd4935b5621891a78629ca7e594f1c3cb307b9ef322d24d72ca99c4c0f96d74adb2fd4ba8e7ddfd5a3780eae4807ac0b127421')

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
