# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=beast
pkgver=1.10.4
pkgrel=1
pkgdesc="Bayesian Evolutionary Analysis Sampling Trees"
arch=('x86_64')
url="http://beast.community/"
license=('LGPL-2.1 License')
source=("https://github.com/beast-dev/beast-mcmc/releases/download/v${pkgver}/BEASTv${pkgver}.tgz")
sha256sums=('SKIP')
depends=(
	'jre-openjdk-headless'
	'jre-openjdk'
	'jdk-openjdk'
	'openjdk-doc'
	'openjdk-src'
)
package() {
    mkdir "${pkgdir}/usr"
    mkdir "${pkgdir}/usr/bin"
    mkdir "${pkgdir}/usr/share"
    mkdir "${pkgdir}/usr/share/applications"
    mkdir "${pkgdir}/usr/share/beast"
    mkdir "${pkgdir}/usr/share/beast/bin"
    mkdir "${pkgdir}/usr/share/beast/images"
    mkdir "${pkgdir}/usr/share/beast/lib"
    mkdir "${pkgdir}/usr/share/beast/native"
    mkdir "${pkgdir}/usr/share/beast/doc"
    
    install -m 755 ${srcdir}/beast/bin/beast ${pkgdir}/usr/share/beast/bin/beast
    install -m 755 ${srcdir}/beast/bin/beauti ${pkgdir}/usr/share/beast/bin/beauti
    install -m 755 ${srcdir}/beast/bin/loganalyser ${pkgdir}/usr/share/beast/bin/loganalyser
    install -m 755 ${srcdir}/beast/bin/logcombiner ${pkgdir}/usr/share/beast/bin/logcombiner
    install -m 755 ${srcdir}/beast/bin/treeannotator ${pkgdir}/usr/share/beast/bin/treeannotator
    install -m 755 ${srcdir}/beast/bin/treestat ${pkgdir}/usr/share/beast/bin/treestat
    
    install -m 755 ${srcdir}/beast/doc/README.txt ${pkgdir}/usr/share/beast/doc/README.txt

    install -m 755 ${srcdir}/beast/lib/beast.jar ${pkgdir}/usr/share/beast/lib/beast.jar
    install -m 755 ${srcdir}/beast/lib/beauti.jar ${pkgdir}/usr/share/beast/lib/beauti.jar

    install -m 755 ${srcdir}/beast/images/beast.png ${pkgdir}/usr/share/beast/images/beast.png
    install -m 755 ${srcdir}/beast/images/beauti.png ${pkgdir}/usr/share/beast/images/beauti.png
    install -m 755 ${srcdir}/beast/images/utility.png ${pkgdir}/usr/share/beast/images/utility.png
    
    install -m 755 ${srcdir}/beast/README.txt ${pkgdir}/usr/share/beast/README.txt
    install -m 755 "${srcdir}/beast/VERSION HISTORY.txt" "${pkgdir}/usr/share/beast/VERSION HISTORY.txt"
    
    install -m 755 ${srcdir}/beast/native/AminoAcidLikelihoodCore.c ${pkgdir}/usr/share/beast/native/AminoAcidLikelihoodCore.c
    install -m 755 ${srcdir}/beast/native/AminoAcidLikelihoodCore.h ${pkgdir}/usr/share/beast/native/AminoAcidLikelihoodCore.h
    install -m 755 ${srcdir}/beast/native/compileNativeWin32.bat ${pkgdir}/usr/share/beast/native/compileNativeWin32.bat
    install -m 755 ${srcdir}/beast/native/GeneralLikelihoodCore.c ${pkgdir}/usr/share/beast/native/GeneralLikelihoodCore.c
    install -m 755 ${srcdir}/beast/native/GeneralLikelihoodCore.h ${pkgdir}/usr/share/beast/native/GeneralLikelihoodCore.h
    install -m 755 ${srcdir}/beast/native/Makefile.amd64 ${pkgdir}/usr/share/beast/native/Makefile.amd64
    install -m 755 ${srcdir}/beast/native/Makefile.ia64 ${pkgdir}/usr/share/beast/native/Makefile.ia64
    install -m 755 ${srcdir}/beast/native/Makefile.icc ${pkgdir}/usr/share/beast/native/Makefile.icc
    install -m 755 ${srcdir}/beast/native/Makefile.linux ${pkgdir}/usr/share/beast/native/Makefile.linux
    install -m 755 ${srcdir}/beast/native/NativeMemoryLikelihoodCore.c ${pkgdir}/usr/share/beast/native/NativeMemoryLikelihoodCore.c
    install -m 755 ${srcdir}/beast/native/NativeMemoryLikelihoodCore.h ${pkgdir}/usr/share/beast/native/NativeMemoryLikelihoodCore.h
    install -m 755 ${srcdir}/beast/native/NativeSubstitutionModel.c ${pkgdir}/usr/share/beast/native/NativeSubstitutionModel.c
    install -m 755 ${srcdir}/beast/native/NativeSubstitutionModel.h ${pkgdir}/usr/share/beast/native/NativeSubstitutionModel.h
    install -m 755 ${srcdir}/beast/native/NucleotideLikelihoodCore.c ${pkgdir}/usr/share/beast/native/NucleotideLikelihoodCore.c
    install -m 755 ${srcdir}/beast/native/NucleotideLikelihoodCore.h ${pkgdir}/usr/share/beast/native/NucleotideLikelihoodCore.h    
    
    ln -s /usr/share/beast/bin/beauti ${pkgdir}/usr/bin/beauti
    ln -s /usr/share/beast/bin/beast ${pkgdir}/usr/bin/beast
    ln -s /usr/share/beast/bin/logcombiner ${pkgdir}/usr/bin/logcombiner
    ln -s /usr/share/beast/bin/treeannotator ${pkgdir}/usr/bin/treeannotator
    ln -s /usr/share/beast/bin/treestat ${pkgdir}/usr/bin/treestat
    
    cp ~/.cache/yay/beast/treestat.png ${pkgdir}/usr/share/beast/images/
    
    cp ~/.cache/yay/beast/beauti.desktop ${pkgdir}/usr/share/applications
    cp ~/.cache/yay/beast/beast.desktop ${pkgdir}/usr/share/applications
    cp ~/.cache/yay/beast/treestat.desktop ${pkgdir}/usr/share/applications
    cp ~/.cache/yay/beast/logcombiner.desktop ${pkgdir}/usr/share/applications
    cp ~/.cache/yay/beast/treeannotator.desktop ${pkgdir}/usr/share/applications
}
