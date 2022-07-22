# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=beast
pkgver=1.10.4
pkgrel=10
provides=("beast")
pkgdesc="Bayesian Evolutionary Analysis Sampling Trees. https://doi.org/10.1186/1471-2148-7-214"
arch=('x86_64')
url="http://beast.community/"
license=('LGPL-2.1 License')
source=("https://github.com/beast-dev/beast-mcmc/releases/download/v${pkgver}/BEASTv${pkgver}.tgz" "beast_beast.desktop" "beauti_beast.desktop" "logcombiner_beast.desktop" "treeannotator_beast.desktop" "treestat_beast.desktop" "treestat.png")
sha256sums=('be652c4d55953f7c6c7a9d3eb3de203c77dc380e81ad81cfe0492408990c36a8'
            '4f3118c4ffc2added01200a42417cbdf0ca8549ab0b6fb5516b2eec2a2d77d14'
            '8baa97527cf3af1c6f2b4cbe2825da83117b315222fb0b685e82a4b61bcaac3e'
            'b420f1c78a2daf9b4a4d572a90228d83dcc9aba02690be8387c4e37d0f1ebe05'
            '2317783703a95a98fc91a0a6d392bec1569e71ac62750d48a867e17c58b79586'
            '32947f594b74e8aaf11813768dbf3be1eeec8153eb5d126da3800e8b34bc1396'
            'aca5c3f88ea8624d94b9e6e0e8f4b41a1f981562ad33bee2f35cc15de84f9906')
depends=('java-runtime')
makedepends=('java-environment')
package() {
    install -dm755 "$pkgdir"/usr/{bin,share/{applications,${pkgname}}}

    mv ${srcdir}/BEASTv${pkgver}/* ${pkgdir}/usr/share/beast/
     
    ln -s /usr/share/beast/bin/beauti ${pkgdir}/usr/bin/beauti_beast
    ln -s /usr/share/beast/bin/beast ${pkgdir}/usr/bin/beast_beast
    ln -s /usr/share/beast/bin/logcombiner ${pkgdir}/usr/bin/logcombiner_beast
    ln -s /usr/share/beast/bin/treeannotator ${pkgdir}/usr/bin/treeannotator_beast
    ln -s /usr/share/beast/bin/treestat ${pkgdir}/usr/bin/treestat_beast

    install -m 755 treestat.png ${pkgdir}/usr/share/beast/images/
    install -m 755 *.desktop ${pkgdir}/usr/share/applications
    }
