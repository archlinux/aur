# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Matthew Gamble <git@matthewgamble.net>

pkgname="scrutiny-bin"
pkgver=0.7.3
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

b2sums=('dac41bc16013c2a2d2973082f1dfc22c29d2fb8be44793ac90db681ae9a83d88628340ff040970bdcd8571e240769fb46dd02dc0e0855380923e2d3fd7f3915c'
        'f71fe063cbd7a4c6667220c74bb78e9213e77624ea2e76c8e26856274d8d8346b9bc330bd8c6ccbe5525b7f8cc5f9e35130c59717fc5239f69330190ec32fba0'
        '05f5f21cdac179bf43daed1f1927787dd328aeb69d87aeb97aeecd27dc2758d5a7bd591f3ae2a27265fce7ab4fedbfa757496893fbe1b4a794c17ed5108c6efd'
        'f634bb3b85695225af5bc77a0e5ec3e09844fa4794b40381e1a6d1e81ac31cdb1d5b342c13bec33537dfed399777017bd3f323a53873d7356abd9eac5f77e677'
        '60006f6ef9e37dd06d2ce64b9f87deebca9b3021db792a1367773a950ccf10ca708f165c6573a5b9766a5c5dd6b4aa4ec3d5967b1538639a8be8bd35f260b5ca'
        '4d523a659a268383ab334668ec1c1ca6cfa66bfb0ed54e4a82cb17a44dad32fffab530014811f1e937af2c54327edb77ace0c3cfb5b0fe091a01ce8df4ce2994'
        'b76a16ea73807f5624adea7df186bc63c34c73701ca865d42f13b7d718bb88436a1e9510367c8f4af2525473523dfce9722f9da5153aafa1e3d51007510b5c52'
        '9220ff8673c9976b16abf35b9e4f94d541ff1472c4854f149e2bd09accfba0aa142f17b9d3485fe41ece823256fe53d5665c6761846b071b9975408fefdd443b')
b2sums_x86_64=('35e15a80d7f3dabe6ca4bc004fa4b11705f4586e25d52d06f0c579061ee74798b937ec34f5a696b607915b49995cd8d2559fef3519a1862681ea23bbb23bc11d'
               'db65f198831de1af6382f9cf8c603057f7a36e9278e5c63b7eccd73ab9196c55ca1fbc637cf1752eb555de06c5d83c115696e3d80815c9ac2d72acd0d0e9a3d5')
b2sums_armv5h=('ef518352a7c220ab55883ebb3fdf610a70f66b4ce50cd9ca74dc0fb7ff471ea2e31a528e8b9714a76cb68f013777a45cfb800cb9ee4db346524f400fd50cddd6'
               '8210f57595204abc9d1111c27893b0c9f528e14942110647a3abf3a78c9b3bfd666ad97508192493100bc5c25c39693ee3a1d04462505e3b080855071b27d787')
b2sums_armv6h=('5edb307d4275a94b436ef5c1bc0762bc9ed632a07eb0dabe4924cb367a216f8c0ce03164fd9debf4ef02065a5f42dfaa56d7ca41ff218b691619a00580222a48'
               '0e49ab23e1daba719dd7447c6ccc40fc04274384b77836f0d18b93993b9d1a29a673bcdb08f5b003df71c27c7ed0786b1f66ec7f2bc911c03e52d1615ccdc01f')
b2sums_armv7h=('51860c99c1d1497e9cbe1ecce1bddcec67e006b175c5167a2f5b86783ce6c9fcecb70bac28f1dadb60d29afac7f05098e878bfc190d4e64f131fa8980f6e66b5'
               'b590522c3286a46d22fdad79d8886c531e122209290b0d7e68b3946b8a42c4fd7d0da189b1c1e1206fef67c794909c487e3727703bb771084e2e96bdc88507ac')
b2sums_aarch64=('43ffbd55f224c74b2e636cbb29b7a07077a2f339625d96fdc79d9b63aaa2700b458c47603fedccbe118b4e467b2dc42ab4b38c02a7951af50ad8130a53f1c1f4'
                '50126d2d7729b38e755cf92aade68dc74bb64e3e2bc6dff2b2af5a47e717b4bb0457ce549439e8b1f4df2c87374655751bd57d35db01db4243733631941a3b0e')

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
