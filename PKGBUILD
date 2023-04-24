# Maintainer: jswagner <jason-at-jason;s.wagner*dot,com>
_prgname=burnoutsharp
pkgname=burnoutsharp-bin
url="https://github.com/mnadareski/BurnOutSharp"
arch=('x86_64')
pkgdesc="C# protection, packer, and archive scanning library (.NET 4.8 version)"
provides=('burnoutsharp')
depends=('mono')
pkgver=2.7.0
pkgrel=1
license=('MIT')
source=('https://github.com/mnadareski/BurnOutSharp/releases/download/2.7.0/BurnOutSharp.2.7.0_net48.zip'
'https://raw.githubusercontent.com/mnadareski/BurnOutSharp/master/README.md'
'https://raw.githubusercontent.com/mnadareski/BurnOutSharp/master/LICENSE')
sha256sums=('6083d7adf0123c3feeb9567e21e3513182a2d4abe23f0f01a7a422a805517dbc'
'SKIP'
'SKIP')

package() {

	# install burnoutsharp distribution
	install -Dm 644 ${srcdir}/BurnOutSharp.ASN1.dll ${pkgdir}/opt/${_prgname}/BurnOutSharp.ASN1.dll
	install -Dm 644 ${srcdir}/BurnOutSharp.ASN1.pdb ${pkgdir}/opt/${_prgname}/BurnOutSharp.ASN1.pdb
	install -Dm 644 ${srcdir}/BurnOutSharp.Builders.dll ${pkgdir}/opt/${_prgname}/BurnOutSharp.Builders.dll
	install -Dm 644 ${srcdir}/BurnOutSharp.Builders.pdb ${pkgdir}/opt/${_prgname}/BurnOutSharp.Builders.pdb
	install -Dm 644 ${srcdir}/BurnOutSharp.Compression.dll ${pkgdir}/opt/${_prgname}/BurnOutSharp.Compression.dll
	install -Dm 644 ${srcdir}/BurnOutSharp.Compression.pdb ${pkgdir}/opt/${_prgname}/BurnOutSharp.Compression.pdb
	install -Dm 644 ${srcdir}/BurnOutSharp.dll ${pkgdir}/opt/${_prgname}/BurnOutSharp.dll
	install -Dm 644 ${srcdir}/BurnOutSharp.dll.config ${pkgdir}/opt/${_prgname}/BurnOutSharp.dll.config
	install -Dm 644 ${srcdir}/BurnOutSharp.Matching.dll ${pkgdir}/opt/${_prgname}/BurnOutSharp.Matching.dll
	install -Dm 644 ${srcdir}/BurnOutSharp.Matching.pdb ${pkgdir}/opt/${_prgname}/BurnOutSharp.Matching.pdb
	install -Dm 644 ${srcdir}/BurnOutSharp.Models.dll ${pkgdir}/opt/${_prgname}/BurnOutSharp.Models.dll
	install -Dm 644 ${srcdir}/BurnOutSharp.Models.pdb ${pkgdir}/opt/${_prgname}/BurnOutSharp.Models.pdb
	install -Dm 644 ${srcdir}/BurnOutSharp.pdb ${pkgdir}/opt/${_prgname}/BurnOutSharp.pdb
	install -Dm 644 ${srcdir}/BurnOutSharp.Utilities.dll ${pkgdir}/opt/${_prgname}/BurnOutSharp.Utilities.dll
	install -Dm 644 ${srcdir}/BurnOutSharp.Utilities.pdb ${pkgdir}/opt/${_prgname}/BurnOutSharp.Utilities.pdb
	install -Dm 644 ${srcdir}/BurnOutSharp.Wrappers.dll ${pkgdir}/opt/${_prgname}/BurnOutSharp.Wrappers.dll
	install -Dm 644 ${srcdir}/BurnOutSharp.Wrappers.pdb ${pkgdir}/opt/${_prgname}/BurnOutSharp.Wrappers.pdb
	install -Dm 644 ${srcdir}/CascLib.dll ${pkgdir}/opt/${_prgname}/CascLib.dll
	install -Dm 644 ${srcdir}/ICSharpCode.SharpZipLib.dll ${pkgdir}/opt/${_prgname}/ICSharpCode.SharpZipLib.dll
	install -Dm 644 ${srcdir}/OpenMcdf.dll ${pkgdir}/opt/${_prgname}/OpenMcdf.dll
	install -Dm 644 ${srcdir}/SharpCompress.dll ${pkgdir}/opt/${_prgname}/SharpCompress.dll
	install -Dm 644 ${srcdir}/StormLib.dll ${pkgdir}/opt/${_prgname}/StormLib.dll
	install -Dm 644 ${srcdir}/System.Buffers.dll ${pkgdir}/opt/${_prgname}/System.Buffers.dll
	install -Dm 644 ${srcdir}/System.Memory.dll ${pkgdir}/opt/${_prgname}/System.Memory.dll
	install -Dm 644 ${srcdir}/System.Numerics.Vectors.dll ${pkgdir}/opt/${_prgname}/System.Numerics.Vectors.dll
	install -Dm 644 ${srcdir}/System.Runtime.CompilerServices.Unsafe.dll ${pkgdir}/opt/${_prgname}/System.Runtime.CompilerServices.Unsafe.dll
	install -Dm 644 ${srcdir}/System.Text.Encoding.CodePages.dll ${pkgdir}/opt/${_prgname}/System.Text.Encoding.CodePages.dll
	install -Dm 644 ${srcdir}/System.Threading.Tasks.Extensions.dll ${pkgdir}/opt/${_prgname}/System.Threading.Tasks.Extensions.dll
	install -Dm 755 ${srcdir}/Test.exe ${pkgdir}/opt/${_prgname}/Test.exe
	install -Dm 644 ${srcdir}/Test.exe.config ${pkgdir}/opt/${_prgname}/Test.exe.config
	install -Dm 644 ${srcdir}/Test.pdb ${pkgdir}/opt/${_prgname}/Test.pdb
	install -Dm 644 ${srcdir}/UnshieldSharp.dll ${pkgdir}/opt/${_prgname}/UnshieldSharp.dll
	install -Dm 644 ${srcdir}/WiseUnpacker.dll ${pkgdir}/opt/${_prgname}/WiseUnpacker.dll
	install -Dm 644 ${srcdir}/zlib.net.dll ${pkgdir}/opt/${_prgname}/zlib.net.dll

	# install documentation
	install -Dm 644 ${srcdir}/README.md ${pkgdir}/usr/local/share/doc/${_prgname}/README.md

	# install license
	install -Dm 644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${_prgname}/LICENSE

	# create convenience script
	mkdir ${pkgdir}/usr/bin
	echo "#!/bin/bash" > ${pkgdir}/usr/bin/${_prgname}
	echo "mono /opt/${_prgname}/Test.exe \$@" >> ${pkgdir}/usr/bin/${_prgname}
	chmod 755 ${pkgdir}/usr/bin/${_prgname}

}
