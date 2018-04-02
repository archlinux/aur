# Maintainer: Josh Marshall <jrmarsha@mtu.edu>

pkgname=pfam
pkgver=31.0
pkgrel=1
pkgdesc='The Pfam database is a large collection of protein families, each represented by multiple sequence alignments and hidden Markov models (HMMs). '
arch=('any')
license=('CC0')
url='ftp://ftp.ebi.ac.uk'
depends=('hmmer')
makedepends=('bash')
provides=()
path="/pub/databases/Pfam/current_release"
source=(
        "$url$path/Pfam-A.clans.tsv.gz"
        "$url$path/Pfam-A.dead.gz"
        "$url$path/Pfam-A.fasta.gz"
        "$url$path/Pfam-A.full.gz"
        "$url$path/Pfam-A.full.metagenomics.gz"
        "$url$path/Pfam-A.full.ncbi.gz"
        "$url$path/Pfam-A.full.uniprot.gz"
        "$url$path/Pfam-A.hmm.dat.gz"
        "$url$path/Pfam-A.hmm.gz"
        "$url$path/Pfam-A.regions.tsv.gz"
        "$url$path/Pfam-A.regions.uniprot.tsv.gz"
        "$url$path/Pfam-A.rp15.gz"
        "$url$path/Pfam-A.rp35.gz"
        "$url$path/Pfam-A.rp55.gz"
        "$url$path/Pfam-A.rp75.gz"
        "$url$path/Pfam-A.seed.gz"
        "$url$path/Pfam-C.gz"
        "$url$path/Pfam.version.gz"
        "$url$path/active_site.dat.gz"
        "$url$path/diff.gz"
        "$url$path/metaseq.gz"
        "$url$path/ncbi.gz"
        "$url$path/pdbmap.gz"
        "$url$path/pfamseq.gz"
        "$url$path/relnotes.txt"
        "$url$path/swisspfam.gz"
        "$url$path/trees.tgz"
        "$url$path/uniprot.gz"
        "$url$path/uniprot_reference_proteomes.dat.gz"
        "$url$path/uniprot_sprot.dat.gz"
        "$url$path/uniprot_trembl.dat.gz"
        "$url$path/userman.txt"
        )
md5sums=(
'8951c2a33e7f77c562473097d6ac2b33'  #Pfam-A.clans.tsv.gz
'84911a0062127ed317c78cbc914ddf87'  #Pfam-A.dead.gz
'118fe71332b219fcd0a3e637f1071daa'  #Pfam-A.fasta.gz
'18e8e092530bd5bea65027eafd48071d'  #Pfam-A.full.gz
'2aefa6868e6b90e81ee3bc49f5f488d3'  #Pfam-A.full.metagenomics.gz
'07addfd349bd1210d669a0943c9d4710'  #Pfam-A.full.ncbi.gz
'57b776bf6af21ad2444dc22cc0b5f52b'  #Pfam-A.full.uniprot.gz
'ebd972c5d7723213b254b44362fd7ff1'  #Pfam-A.hmm.dat.gz
'b6fda5fdc90d24fbc1484d3b641d4e32'  #Pfam-A.hmm.gz
'05545e623b17c445e9f4daf35de299a3'  #Pfam-A.regions.tsv.gz
'f5a35b1a69cbaf0ea711ab34567a5cbc'  #Pfam-A.regions.uniprot.tsv.gz
'18cf5026bf9c582330bb79dc81369fbf'  #Pfam-A.rp15.gz
'1ae926383d04bb8bb49c2638742ea692'  #Pfam-A.rp35.gz
'55aeeab2ea19da2c80d70e10c7d24e0f'  #Pfam-A.rp55.gz
'0b23fa218d00ddcb1905a5c96bb90e98'  #Pfam-A.rp75.gz
'769f26046f6cd40e3b98aab20444ad07'  #Pfam-A.seed.gz
'f1dd39486bbbd6ec58a4375e5792ebe7'  #Pfam-C.gz
'3e47eec766a99b599cb24f28c4d393f8'  #Pfam.version.gz
'e3abb05823817e0c7ef77888a5c6906d'  #active_site.dat.gz
'1fb93cc2ef9302cb3a77586d7a2cb31c'  #diff.gz
'b2d5702cd3d8cfbd91818a0eebf3230d'  #metaseq.gz
'3db585e9bbd6b7f8a2dc97c1ff3b14b0'  #ncbi.gz
'c255691cd9e8315d7895109cc2e27de7'  #pdbmap.gz
'a7361044f6e85355cb75bc2c898cc8c4'  #pfamseq.gz
'd763ba0cadbc8d112ea8b160b4d684b2'  #relnotes.txt
'cda141456671a58bb320301c0d7e57d8'  #swisspfam.gz
'6421632157ebe5c596ff7b03fa4a7c38'  #trees.tgz
'd4aa02ea20995d12ef476e5190f5640d'  #uniprot.gz
'762a2f475b80a70114a9dffe631842bb'  #uniprot_reference_proteomes.dat.gz
'8595d709244198798facb83edffb0ee8'  #uniprot_sprot.dat.gz
'c6d85f03c6b7828bc2c9cef7f77fdffd'  #uniprot_trembl.dat.gz
'6b5708e27461b2e705a73898be881d5f'  #userman.txt
)

package() {
  mkdir -p  "$pkgdir/opt/$pkgname/"
  rm -f *.gz *.tgz
  find * -maxdepth 0 -regex '.+\.gz|.+\.tgz|LICENSE' -prune -o -print0 | xargs -0 -i cp -rfHL {} "$pkgdir/opt/$pkgname/"
}
