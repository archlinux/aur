# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Matthew Gamble <git@matthewgamble.net>

pkgname="scrutiny-bin"
pkgver=0.7.2
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

b2sums=('56ab5d1a693ef208f8cdc5430d6073a5deef1ad8046dc7b86ae1fb7289df364e0157b376951265ad51685908048bf334cac7b2a27fbecfa5a504c76a015a4a05'
        'a6f531a6eff4577390d9f0ac1c10ef06dce15c8d8a179a4e4eb91903fa19e264e118f36cf711dfcce6cd25dc2f0179b5df2648500a8b176eaa55a4072b28c393'
        '05f5f21cdac179bf43daed1f1927787dd328aeb69d87aeb97aeecd27dc2758d5a7bd591f3ae2a27265fce7ab4fedbfa757496893fbe1b4a794c17ed5108c6efd'
        'f634bb3b85695225af5bc77a0e5ec3e09844fa4794b40381e1a6d1e81ac31cdb1d5b342c13bec33537dfed399777017bd3f323a53873d7356abd9eac5f77e677'
        '60006f6ef9e37dd06d2ce64b9f87deebca9b3021db792a1367773a950ccf10ca708f165c6573a5b9766a5c5dd6b4aa4ec3d5967b1538639a8be8bd35f260b5ca'
        '4d523a659a268383ab334668ec1c1ca6cfa66bfb0ed54e4a82cb17a44dad32fffab530014811f1e937af2c54327edb77ace0c3cfb5b0fe091a01ce8df4ce2994'
        'b76a16ea73807f5624adea7df186bc63c34c73701ca865d42f13b7d718bb88436a1e9510367c8f4af2525473523dfce9722f9da5153aafa1e3d51007510b5c52'
        '9220ff8673c9976b16abf35b9e4f94d541ff1472c4854f149e2bd09accfba0aa142f17b9d3485fe41ece823256fe53d5665c6761846b071b9975408fefdd443b')
b2sums_x86_64=('a89ddd52e454fe5fc1c526d83a5786ad809ce6631a58d1957cc72bcff9587fbe30682bc41e02459f90fd018242eab6c2262e0b33debc53c7dbf44f8148a76121'
               '23305501b8bf474cc0a3f51a9943de438d8a4c402d0562813eb83d015d8effa44cd72d4d5e5094d4d4ea5135cd4001336020c1095038435aa9a7bea7b781c586')
b2sums_armv5h=('ef948e4f5823fdeeb98196adf110de3a00bfa711a86984e8e5db49255573e87568f0334480d33cec3e1f29fd89072b414fc9b6d86484000d243cf1df3ebabd09'
               'c2b6d45961656e27fa73a9bd7ad98438c475471b8e7af1b776bd503de5822282c9a570262a092fd2ccd60dc8d9de5d464a4c27e1123a959cd9a773cdada61a8c')
b2sums_armv6h=('a165e59cc9eb80d985f055b7c8b2d2e765184ab66d7c16f9e4ec4a103aa70a27f8718bc31981204eb0a269cc54e65572278ce312fa5b6e73054bdf42c0e6a348'
               '705eff046ed290a1a594be0f555bca3779cfb64e6ef5f8b1c49d9a2fc9d2e5238dbc0e1e832b46e4c5e224382df5d6ec0b3346271cffe0da27e75a7a140d9aa9')
b2sums_armv7h=('5fc4b103fde6a1c677aa6e47868143ffed6cbbc379d1b163d3eba8ea84ae4cf10b925db3364c5809584b3976f6289d54492525d1135d8e0ccf611c518564ccf9'
               '9ac5c7fa4b00f2425310d59cd66ef1f97e2115899ee960e72fe7588bbbec9629f10e1fba94acf5b4c973b2938fdf7b04a1e4af663c5a9703ef081486a704333c')
b2sums_aarch64=('d73da5b3806ceeecade2b3c3a15537af77c6966997d53de22666f09ff43669dbfcf717e19d6a19ff0bbd7811b1498e46cd54b5b0c5278177cb5f92a8f98687a6'
                '3bab26b7ee6dbbbae61e4bf5066c6582afcbc146cf6ee1cf1f4a83ba316548abd5091435bb5814c911de331b039bf8828af3b8f5ae7f9be1ffecf3d76dc13426')

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
