# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Matthew Gamble <git@matthewgamble.net>

pkgname="scrutiny-bin"
pkgver=0.9.2
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

b2sums=('0487d5bb11a77a56e9e5b6fb2e1e5ecde7032b086129c413ad54d1caf284828e09419cc94b5dcc7240334fbdc09f98cae9cf058e6149a0a3b1e1fc96aa50c44a'
        '2ec4769cd752f625c08c716ee2f5c3862cbfd388e5ac2537a14f4764be021a14c023b3a69b80d3017205efa74dd175f9f1b32822487446b06e5f0fc6aca42ed0'
        'ec0e26174d1f0b5c733bbbaf348c1ecd3bdac5fa145846a88ada7bbb680b0f9beb3af3f965aabc7a5880b199569b6a9315e63bf5f06e89cde5bfd9873ed826fa'
        'f634bb3b85695225af5bc77a0e5ec3e09844fa4794b40381e1a6d1e81ac31cdb1d5b342c13bec33537dfed399777017bd3f323a53873d7356abd9eac5f77e677'
        '60006f6ef9e37dd06d2ce64b9f87deebca9b3021db792a1367773a950ccf10ca708f165c6573a5b9766a5c5dd6b4aa4ec3d5967b1538639a8be8bd35f260b5ca'
        '4d523a659a268383ab334668ec1c1ca6cfa66bfb0ed54e4a82cb17a44dad32fffab530014811f1e937af2c54327edb77ace0c3cfb5b0fe091a01ce8df4ce2994'
        'a98118d0c156d056a89ba1177a338a4061e54a029f9c6021cd8f71c77e6acdbf4b4432e371f07f04177655496b3f30818284d089958e7896b22479515bb18bf9'
        '9220ff8673c9976b16abf35b9e4f94d541ff1472c4854f149e2bd09accfba0aa142f17b9d3485fe41ece823256fe53d5665c6761846b071b9975408fefdd443b')
b2sums_x86_64=('4476168139f1efabfcc2d84126c0586771b4ec476943e27251551d6c4746c099964a78f9f756a1650c09470d380da1d616352165cc89a02fad39975cf49faa7f'
               'f05a4820a69673937b240ea5d8855bb83e975c06088365761cfcff9adca36acb9e8b7f4fef33992a8dcdfb42f7cd0f7c189a46f8837843c69439074255888a9f')
b2sums_armv5h=('db014dee568ac206912e1211ef81d6fb4e55eb936cfa554e5cf3e8251e71517a7b2b0579e5750b68748e09ddf612da8bb6e51ec0329ef015e5538326b13058c9'
               'edd85075bdd225c333602435bfa0c2205bd35e0c0f61e93ec074f18307be8dc7b2ff8fff28df3693d816a45a4a0f750f0f679733b878442fa7ed2d4efcab7419')
b2sums_armv6h=('85e634bec37cffaa290f8ceb0a61a7c866a0b345da86a164a3e694f6378843d3548da4f1632bd14c2927d1033c7eb69984ca58c99c5b2e27cefcca7261e9b6ce'
               'c6afd052ca27368d874ba033a05dc04f3f0cf1c2929b600af05480c4796fdad5778d4d692ca83f209671d0df992b314ff850d7c2cc88792252cc0f6c99471251')
b2sums_armv7h=('d58d35b6c9b310426a918c5cfbb186ba04725271ce41df458587901df33348649988754e1efcc0081d512caab8eee9f0685f924458a21b1d063f1f1dade6fde3'
               '9bf7f3e36938b3314fc17b478fbb41471e01c353727dae36df263849526237d296f8120208025d7e7bbbaf1327875e2ee124004b8e9d74cab5c5d29e2245e5b0')
b2sums_aarch64=('e0ed5f3a5b405653bec48e352f9a2715d87d18f86d28244606ef2f94a4eeaf2f50385fe12bfc6067fb58148b952cad39cea80cc4e16bf950e9faec9b424429ee'
                '6b1b37a5556b9066afc8c6efd6a43eac7c1deb8f8c1c8f3ade230665925e97657d5428da5ba675ebdaf81af2bef411ff819900ce326cf3ff48c7abcdaf306149')

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
