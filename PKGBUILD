# Maintainer: bilabila <bilabila@qq.com>
pkgname=ocp-setup
pkgver=1.4
pkgrel=4
pkgdesc='oceanbase cloud platform setup'
arch=(x86_64)
url=https://oceanbase.alipay.com/docs
provides=($pkgname)
conflicts=($pkgname)
license=(custom)
depends=(java-openjfx)
source=('https://gw.alipayobjects.com/os/downloads/ossupload/ocp-release.zip'
$pkgname)
sha512sums=(SKIP
47e69cb025eda1607a3bd721a4b236a972fd5a37c18883168d0b78d65ca134884efbf876206fc577938fba5b951a31bca9ae70393874cd6171fb2f38030fa175)
install=$pkgname.install
package() {
    cd ocp-release
    d="$pkgdir"/usr/share/$pkgname
    for i in *;do
        install -Dm644 "$i" "$d"/"$i"
    done
    install -Dm755 "$srcdir"/$pkgname \
        "$pkgdir"/usr/bin/$pkgname
}
