# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Matthew Gamble <git@matthewgamble.net>

pkgname="scrutiny-bin"
pkgver=0.9.0
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

b2sums=('68263df99996d06e6f9fc237b6b7798e6ce60d99dd591963e29b2b89eb68ac7166274375e55dc2637fa08575719ba2974fdba5600c3f3e7936e2e9568881bbf5'
        '2ec4769cd752f625c08c716ee2f5c3862cbfd388e5ac2537a14f4764be021a14c023b3a69b80d3017205efa74dd175f9f1b32822487446b06e5f0fc6aca42ed0'
        'ec0e26174d1f0b5c733bbbaf348c1ecd3bdac5fa145846a88ada7bbb680b0f9beb3af3f965aabc7a5880b199569b6a9315e63bf5f06e89cde5bfd9873ed826fa'
        'f634bb3b85695225af5bc77a0e5ec3e09844fa4794b40381e1a6d1e81ac31cdb1d5b342c13bec33537dfed399777017bd3f323a53873d7356abd9eac5f77e677'
        '60006f6ef9e37dd06d2ce64b9f87deebca9b3021db792a1367773a950ccf10ca708f165c6573a5b9766a5c5dd6b4aa4ec3d5967b1538639a8be8bd35f260b5ca'
        '4d523a659a268383ab334668ec1c1ca6cfa66bfb0ed54e4a82cb17a44dad32fffab530014811f1e937af2c54327edb77ace0c3cfb5b0fe091a01ce8df4ce2994'
        'a98118d0c156d056a89ba1177a338a4061e54a029f9c6021cd8f71c77e6acdbf4b4432e371f07f04177655496b3f30818284d089958e7896b22479515bb18bf9'
        '9220ff8673c9976b16abf35b9e4f94d541ff1472c4854f149e2bd09accfba0aa142f17b9d3485fe41ece823256fe53d5665c6761846b071b9975408fefdd443b')
b2sums_x86_64=('8715009a832f2b0c7119864e71fd055d2d0a4d89b8e0a855aebe4afd49f3981af01398c8b01a598879694fdd317761eb21536faf29c1d1710e74e916f6a298e4'
               '322f316bbdfd77b446633fc8826250ee9c7813172454ec3068b02d95fa497301762f15550ff9eaed2578e5676ea19f0b42c33f1a646b4063a5c813cb6e153a7a')
b2sums_armv5h=('8b02cbec3246d2f649d6c842324c2f719fda9ac2b023f5a9c404b579abbe750189635d4e6b794558fd514e5a12ef4fe99bed09be4612d1e172931f10622b08f4'
               'c8bd3ba84add9e79e08541fd035fbb04cd343d1d226652b0f31c37bf2aee56065f35c20f959d934e29b7a2e11c1d3f5286da3a7819243419c39fe328a464e0c6')
b2sums_armv6h=('218316ed72ee359d43f00aa3455aca4ba51b3ebae5dcc3364d8d4c362aea4ce8e412580e4fbf76855e8bc89264bea70cb46fdd24a76143ef702d81fabc7f7f01'
               '582a9c9f992ec00423c56d5c11ed463959169583bb586a34409f2aa22ad3bcda9314b53c0d6ce312cf6a31e6effb1839dc7c234c4390ea65206b1e5abd73dc55')
b2sums_armv7h=('42caba35d75ecd7c22686bcd077414a912618903c3e13fc308beec14ab689ec5f63b5ce858a7047e8b63516320efee13cc0d850fd9c4ad554a38ad3480def8c8'
               'b1e480cfc7c69d86b626af12e47ad64d287364579aae8f6600fff1750e9b455d5a1c5354246ee3803b1453c07de69c189c74d76187327e8c923f9f2a6e0b3952')
b2sums_aarch64=('fd6c888bf838db3405c2044ebfedd690631d2b8bf2788d2b1406e799c53882cfb48699d7170e75e079230795504f368f3c039eea3d1af77e250e118376bbeda8'
                '0e7ffbd43944c94ed3234f333e126fd1acc10025572fb22c0ad17545222b5518b6bef2d93659f2d92acb40f65a97e743b214c189c9b72a5f663db6a8d0bedfaf')

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
